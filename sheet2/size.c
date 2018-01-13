#define _GNU_SOURCE
#include <assert.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <time.h>

static inline double gettime(void) {
    struct timespec ts = {};
    if (clock_gettime(CLOCK_MONOTONIC, &ts)) {
        perror("getting time");
        abort();
    }
    return (ts.tv_sec + ts.tv_nsec / 1.0e9);
}

char *format_human(uint64_t bytes) {
    char *str;
    double scaled;
    char *format;
    if (bytes < 1024llu) {
        scaled = bytes;
        format = "%.2lf B";
    } else if (bytes < 1024llu * 1024llu) {
        scaled = bytes / 1024.;
        format = "%.2lf KiB";
    } else if (bytes < 1024llu * 1024llu * 1024llu) {
        scaled = bytes / (1024. * 1024.);
        format = "%.2lf MiB";
    } else if (bytes < 1024llu * 1024llu * 1024llu) {
        scaled = bytes / (1024. * 1024. * 1024.);
        format = "%.2lf GiB";
    } else {
        scaled = bytes / (1024. * 1024. * 1024.);
        format = "%.2lf GiB";
    }
    if (asprintf(&str, format, scaled) < 0) {
        perror("asprintf");
        abort();
    }
    return str;
}

union mem_block {
    uint8_t raw[64];
    struct {
        void *next;
        uint64_t visited;
    };
} __attribute__((aligned(64)));
static_assert(sizeof(union mem_block) == 64, "fail");
static_assert(offsetof(union mem_block, next) == 0, "fail");
static_assert(offsetof(union mem_block, visited) == 8, "fail");

union page_block {
    uint8_t raw[4096];
    struct {
        void *next;
        uint64_t visited;
    };
} __attribute__((aligned(4096)));
static_assert(sizeof(union page_block) == 4096, "fail");
static_assert(offsetof(union page_block, next) == 0, "fail");
static_assert(offsetof(union page_block, visited) == 8, "fail");

static void fill_memory(union mem_block *mem, size_t len) {
    for (size_t i = 0; i < len; ++i) {
        mem[i].next = mem + ((i + 1009) % (len));
        mem[i].visited = 0;
    }
}

static void fill_memory_page(union page_block *mem, size_t len) {
    for (size_t i = 0; i < len; ++i) {
        mem[i].next = mem + ((i + 1009) % (len));
        mem[i].visited = 0;
    }
}

static void check_visted(const union mem_block *mem, size_t len) {
#if 0
    for (size_t i = 0; i < len; ++i) {
        if (mem[i].visited != 1) {
            printf("Error: block %zu not visited exactly once but %lu times!\n", i, mem[i].visited);
            abort();
        }
    }
#else
    if (mem[0].visited != 1) {
        printf("Error: block 0 not visited exactly once but %lu times!\n", mem[0].visited);
        abort();
    }
#endif
}

struct measurement {
    double time;
    uint64_t accesses;
    uint64_t blocks;
};

static struct measurement walk_array(union mem_block *mem, const size_t n, const size_t accesses) {
    double start = gettime();
    union mem_block *cur = mem;
    for (size_t i = 0; i < accesses; ++i) {
        cur->visited += 1;
        cur = cur->next;
    }
    double end = gettime();
    return (struct measurement){(end - start), accesses, n};
}

static void printresults(const struct measurement result, bool quiet, bool page_test) {
    if (!quiet) {
        if (page_test) {
            printf("Pages: %lu (%s)\tAvg ns/access: %9.9f\tAccesses: %lu\n", result.blocks,
                   format_human(result.blocks * 4096), result.time * 1e9 / result.accesses,
                   result.accesses);
        } else {
            printf("Blocks: %lu (%s)\tAvg ns/access: %9.9f\tAccesses: %lu\n", result.blocks,
                   format_human(result.blocks * 64), result.time * 1e9 / result.accesses,
                   result.accesses);
        }
    } else {
        printf("%lu\t%9.9f\t%lu\n", result.blocks * 64, result.time * 1e9 / result.accesses,
               result.accesses);
    }
}

int main(int argc, char *argv[]) {
    srand(time(NULL));
    size_t n = 0;
    uint64_t accs = 0;
    bool quiet = false;
    bool page_test = false;
    for (int arg = 1; arg < argc; arg++) {
        if (0 == strcmp("-n", argv[arg])) {
            n = atoi(argv[arg + 1]);
        }
        if (0 == strcmp("--runs", argv[arg])) {
            accs = atoi(argv[arg + 1]);
        }
        if (0 == strcmp("--page", argv[arg])) {
            page_test = true;
        }
        if (0 == strcmp("--quiet", argv[arg])) {
            quiet = true;
        }
    }
    size_t sz;
    union mem_block *mem;
    if (page_test) {
        sz = n * sizeof(union page_block);
    } else {
        sz = n * sizeof(union mem_block);
    }
    void *temp = mmap(NULL, sz, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
    if (temp == MAP_FAILED) {
        perror("mmap");
        abort();
    }
    if (mlock(temp, sz)) {
        perror("mlock");
        abort();
    }
    mem = temp;
    if (page_test)
        fill_memory_page((union page_block *)mem, n);
    else
        fill_memory(mem, n);

    struct measurement mes = walk_array(mem, n, accs);
    if (n > accs)
        check_visted(mem, n);
    printresults(mes, quiet, page_test);
    munlock(temp, sz);
    munmap(temp, sz);
    return 0;
}
