#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int debug = 0;
double *results;
size_t maxStride = 1024*500;
size_t stepSize = 1024;
size_t clockRate = 400 * 1000000;

static inline double gettime(void) {
    struct timespec ts = {};
    if (clock_gettime(CLOCK_MONOTONIC, &ts)) {
        perror("getting time");
        abort();
    }
    return (ts.tv_sec + ts.tv_nsec / 1.0e9);
}

void accessArray(uint8_t* arr, size_t length, size_t run, size_t stride) {
	double start, stop;
	size_t i = 0;
	uint8_t sum = 0;

    start = gettime();
	for (i = stride;i < length; i+=stride) {
		sum += arr[i];
	}
    stop = gettime();

    results[run] = stop - start;
    results[run] = results[run]*clockRate / (length/stride);

    if (sum > 0)
    	printf("%d",sum);
}

static void printresults() {
    size_t i;
    double tmp = 0;

	for (i = 1; i*stepSize < maxStride; i++) {
			if (tmp == results[i-1]) continue;
			tmp = results[i-1];
			printf("Stride: \tAvg CPI:\n");
			printf("%ld:\t%9.9f \n", i*stepSize, results[i-1]);
		}
	printf("\n");
}

int main(int argc, char *argv[]) {
    size_t n, i;
    int arg;

    n = 1024 * 4096;

    for (arg = 1; arg < argc; arg++) {
        if (0 == strcmp("-d", argv[arg])) {
            debug = 1;
        }
        if (0 == strcmp("-n", argv[arg])) {
            n = atoi(argv[arg + 1]);
        }
    }

    uint8_t* arr = (uint8_t*)malloc(sizeof(uint8_t)*n);
    results = (double *)malloc(sizeof(double[maxStride]));

    for (i = 1; i*stepSize < maxStride; i++) {
		accessArray(arr, n, i-1, i*stepSize);
    }
    printf("\n");

    printresults();

    return 0;
}
