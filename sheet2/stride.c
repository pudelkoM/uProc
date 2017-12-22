#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int debug = 0;
double *results;
size_t *strides;
size_t maxStride = 1024;
size_t clockRate = 400 * 1000000;
int count = 0;

static inline double gettime(void) {
    struct timespec ts = {};
    if (clock_gettime(CLOCK_MONOTONIC, &ts)) {
        perror("getting time");
        abort();
    }
    return (ts.tv_sec + ts.tv_nsec / 1.0e9);
}

void accessArray(uint8_t* arr, size_t length, size_t stride) {
	double start, stop, sum;
	size_t i, j;

	sum = 0;

	for (j = 0; j < 6; j++) {
		start = gettime();
		for (i = 0;i < 100; i++) {
			sum += arr[(i*stride)%length];
		}
		stop = gettime();
		sum += stop - start;
	}

	strides[count] = stride;
    results[count] = sum / 6.0;
    results[count] = results[count]*clockRate / 100.0;
    count++;
}

static void printresults() {
    size_t i;
    //double tmp = 0;

	for (i = 0; i < count; i++) {
			//if (tmp > (results[i-1] - 100) && tmp < (results[i-1] + 100)) continue;
			//tmp = results[i-1];
			printf("Stride: \tAvg CPI:\n");
			printf("%9ld:\t%9.9f \n", strides[i], results[i]);
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
    strides = (size_t *)malloc(sizeof(size_t[maxStride]));

    if (arr[0] != 0) printf("Dummy");
    count = 0;
    for (i = 2; i <= maxStride; i*=2) {
		accessArray(arr, n, i);
    }
    printf("\n");

    printresults();

    return 0;
}
