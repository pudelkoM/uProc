#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/random.h>
#include <time.h>

int debug = 0;
const size_t clockRate = 400 * 1000000;

static inline double gettime(void) {
    struct timespec ts = {};
    if (clock_gettime(CLOCK_MONOTONIC, &ts)) {
        perror("getting time");
        abort();
    }
    return (ts.tv_sec + ts.tv_nsec / 1.0e9);
}

static void fill_memory(void *mem, size_t len) {
    if (getrandom(mem, len, 0) < 0) {
        perror("getrandom()");
        abort();
    }
}

struct measurement {
    double time;
    size_t stride;
    uint64_t sum;
};

static struct measurement accessArray(const uint8_t *mem, const size_t len, const size_t stride, const size_t maxStride) {
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

static void printresults(const struct measurement *results, size_t count) {
    for (size_t i = 0; i < count; i++) {
    	if (results[i].stride)
        	printf("Stride: %zu\tAvg ns/access: %9.9f\tSum: %zu\n", results[i].stride, results[i].time * 1e9, results[i].sum);
    }
    printf("\n");
}

int main(int argc, char *argv[]) {
    size_t i;
    int arg;

    const size_t maxStride = 256;
    size_t n = 1024 * 1024 * 256; // 4 MiB
    const size_t mem_len = n * sizeof(uint8_t);

    for (arg = 1; arg < argc; arg++) {
        if (0 == strcmp("-d", argv[arg])) {
            debug = 1;
        }
        if (0 == strcmp("-n", argv[arg])) {
            n = atoi(argv[arg + 1]);
        }
    }

    uint8_t *mem = malloc(mem_len);
    fill_memory(mem, mem_len);
    struct measurement *results = calloc(sizeof(*results), maxStride);

    if (mem[0] != 0)
        printf("Dummy\n");
    for (i = 0; i < maxStride / 2; ++i) {
        results[i] = accessArray(mem, mem_len, 2*i, maxStride);
    }

    printresults(results, maxStride);

    free(mem);
    free(results);
    return 0;
}
