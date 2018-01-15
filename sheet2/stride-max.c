#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/random.h>
#include <time.h>

int debug = 0;
const size_t clockRate = 400 * 1000000;
const size_t maxStride = 129;

static inline double gettime(void) {
    struct timespec ts = {};
    if (clock_gettime(CLOCK_MONOTONIC, &ts)) {
        perror("getting time");
        abort();
    }
    return (ts.tv_sec + ts.tv_nsec / 1.0e9);
}

static void fill_memory(void *mem, size_t len) {
    for (size_t i = 0; i < len / 4; ++i) {
        ((uint32_t *)mem)[i] = rand() % UINT32_MAX;
    }
}

static inline bool IsPowerOfTwo(uint64_t x) { return (x & (x - 1)) == 0; }

struct measurement {
    double time;
    size_t stride;
    uint64_t sum;
};

static struct measurement accessArray(const uint8_t *mem, const size_t len, const size_t stride) {
    // Number of accesses is constant
    const size_t accs = len / maxStride;
    uint64_t sum = 0;
    // Load cache line

    double start = gettime();
    for (size_t i = 0; i < accs; ++i) {
        sum += mem[i * stride];
    }
    double end = gettime();

    // printf("%zu\n", len / maxStride);

    return (struct measurement){(end - start) / (accs * 1.0), stride, sum};
}

static struct measurement accessArray2(const uint8_t *mem, const size_t len, const size_t stride,
                                       const size_t accesses) {
    if (!IsPowerOfTwo(len)) {
        perror("length is not power of 2");
        abort();
    }
    uint64_t sum = 0;
    double start = gettime();
    for (size_t i = 0; i < accesses; ++i) {
        sum += mem[(i * stride) & (len - 1)];
    }
    double end = gettime();
    return (struct measurement){(end - start) / (accesses * 1.0), stride, sum};
}

static void printresults(const struct measurement *results, size_t count) {
    for (size_t i = 0; i < count; i++) {
        if (results[i].stride)
            printf("Stride: %zu\tAvg ns/access: %9.9f\tSum: %zu\n", results[i].stride,
                   results[i].time * 1e9, results[i].sum);
    }
    printf("\n");
}

int main(int argc, char *argv[]) {
    srand(time(NULL));
    size_t i;
    int arg;

    size_t n = 1024 * 1024 * 1024; // 1 MiB
    for (arg = 1; arg < argc; arg++) {
        if (0 == strcmp("-d", argv[arg])) {
            debug = 1;
        }
        if (0 == strcmp("-n", argv[arg])) {
            n = atoi(argv[arg + 1]);
        }
    }
    const size_t mem_len = n * sizeof(uint8_t);

    uint8_t *mem = malloc(mem_len);
    fill_memory(mem, mem_len);
    struct measurement *results = calloc(sizeof(*results), maxStride);

    if (mem[0] != 0)
        printf("Dummy\n");

    // for (i = 0; i < maxStride / 2; ++i) {
    //    results[i] = accessArray2(mem, mem_len, 2 * i, 10000000);
    //}

    for (i = (maxStride / 2) - 1; i > 0; --i) {
        results[i] = accessArray2(mem, mem_len, 2 * i, 10000000);
    }

    printresults(results, maxStride);

    free(mem);
    free(results);
    return 0;
}
