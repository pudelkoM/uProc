#include "options.h"
#include <ctype.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <x86intrin.h>

int debug = 0;
double *results;
double *ratios;
unsigned long *sizes;

int no_sz = 1, no_ratio = 1, no_version = 1;

#define likely(x) __builtin_expect((x), 1)
#define unlikely(x) __builtin_expect((x), 0)

static inline void rte_prefetch0(const volatile void *p) {
    asm volatile("prefetcht0 %[p]" : : [p] "m"(*(const volatile char *)p));
}

static inline double gettime(void) {
    // to be implemented
    uint64_t t = _rdtsc();
    return t / 1e6;
}

static char upper(char c) {
    if (c >= 'a' && c <= 'z')
        return c - 0x20;
    else
        return c;
}

static void toupper_naive(char *text, size_t len) {
    while (true) {
        char c = *text;
        if (c == '\0')
            break;
        if (c >= 'a' && c <= 'z')
            c = c - 0x20;
        *text = c;
        ++text;
    }
}

static void toupper_simple(char *text, size_t len) {
    while (*text) {
        *text = toupper(*text);
        ++text;
    }
}

static void toupper_loop(char *text, size_t len) {
    for (size_t i = 0; i < len; ++i) {
        text[i] = upper(text[i]);
    }
}

static void toupper_unroll(char *text, size_t len) {
    for (size_t i = 0; i < len; i = i + 8) {
        *text = upper(*text);
        text++;
        *text = upper(*text);
        text++;
        *text = upper(*text);
        text++;
        *text = upper(*text);
        text++;
        *text = upper(*text);
        text++;
        *text = upper(*text);
        text++;
        *text = upper(*text);
        text++;
        *text = upper(*text);
        text++;
    }
    for (size_t i = 0; i < len % 8; ++i) {
        *text = upper(*text);
        text++;
    }
}

static void toupper_optimised(char *text, size_t len) {
    rte_prefetch0(text);
    rte_prefetch0(text + 64);
    rte_prefetch0(text + 128);
    while (true) {
        char c = *text;
        if (unlikely(c == '\0'))
            break;
        if (c >= 'a' && c <= 'z')
            c = c - 0x20;
        *text = c;
        ++text;
    }
}

/*****************************************************************/

// align at 16byte boundaries
void *mymalloc(unsigned long int size) {
    void *addr = malloc(size + 32);
    return (void *)((unsigned long int)addr / 16 * 16 + 16);
}

char createChar(int ratio) {
    char isLower = rand() % 100;

    // upper case=0, lower case=1
    if (isLower < ratio)
        isLower = 0;
    else
        isLower = 1;

    char letter = rand() % 26 + 1; // a,A=1; b,B=2; ...

    return 0x40 + isLower * 0x20 + letter;
}

char *init(unsigned long int sz, int ratio) {
    int i = 0;
    char *text = (char *)mymalloc(sz + 1);
    srand(1); // ensures that all strings are identical
    for (i = 0; i < sz; i++) {
        char c = createChar(ratio);
        text[i] = c;
    }
    text[i] = '\0';
    return text;
}

/*
 * ******************* Run the different versions **************
 */

typedef void (*toupperfunc)(char *text, size_t n);

void run_toupper(int size, int ratio, int version, toupperfunc f,
                 const char *name) {
    double start, stop;
    int index;

    index = ratio;
    index += size * no_ratio;
    index += version * no_sz * no_ratio;

    char *text = init(sizes[size], ratios[ratio]);

    if (debug)
        printf("Before: %.40s...\n", text);

    start = gettime();
    (*f)(text, sizes[size]);
    stop = gettime();
    results[index] = stop - start;

    if (debug)
        printf("After:  %.40s...\n", text);
}

struct _toupperversion {
    const char *name;
    toupperfunc func;
} toupperversion[] = {
    {"naive", toupper_naive},
    {"simple", toupper_simple},
    {"loop", toupper_loop},
    {"unroll", toupper_unroll},
    {"optimised", toupper_optimised},
    {0, 0},
};

void run(int size, int ratio) {
    int v;
    for (v = 0; toupperversion[v].func != 0; v++) {
        run_toupper(size, ratio, v, toupperversion[v].func,
                    toupperversion[v].name);
    }
}

void printresults() {
    int i, j, k, index;
    printf("%s\n", OPTS);

    for (j = 0; j < no_sz; j++) {
        for (k = 0; k < no_ratio; k++) {
            printf("Size: %ld \tRatio: %f \tRunning time:\n", sizes[j],
                   ratios[k]);
            for (i = 0; i < no_version; i++) {
                index = k;
                index += j * no_ratio;
                index += i * no_sz * no_ratio;
                printf("\t%s:\t%7.3f \n", toupperversion[i].name,
                       results[index]);
            }
            printf("\n");
        }
    }
}

int main(int argc, char *argv[]) {
    unsigned long int min_sz = 800000, max_sz = 0, step_sz = 10000;
    int min_ratio = 50, max_ratio = 0, step_ratio = 1;
    int arg, i, j, v;
    int no_exp;

    for (arg = 1; arg < argc; arg++) {
        if (0 == strcmp("-d", argv[arg])) {
            debug = 1;
        }
        if (0 == strcmp("-l", argv[arg])) {
            min_sz = atoi(argv[arg + 1]);
            if (arg + 2 >= argc)
                break;
            if (0 == strcmp("-r", argv[arg + 2]))
                break;
            if (0 == strcmp("-d", argv[arg + 2]))
                break;
            max_sz = atoi(argv[arg + 2]);
            step_sz = atoi(argv[arg + 3]);
        }
        if (0 == strcmp("-r", argv[arg])) {
            min_ratio = atoi(argv[arg + 1]);
            if (arg + 2 >= argc)
                break;
            if (0 == strcmp("-l", argv[arg + 2]))
                break;
            if (0 == strcmp("-d", argv[arg + 2]))
                break;
            max_ratio = atoi(argv[arg + 2]);
            step_ratio = atoi(argv[arg + 3]);
        }
    }
    for (v = 0; toupperversion[v].func != 0; v++)
        no_version = v + 1;
    if (0 == max_sz)
        no_sz = 1;
    else
        no_sz = (max_sz - min_sz) / step_sz + 1;
    if (0 == max_ratio)
        no_ratio = 1;
    else
        no_ratio = (max_ratio - min_ratio) / step_ratio + 1;
    no_exp = v * no_sz * no_ratio;
    results = (double *)malloc(sizeof(double[no_exp]));
    ratios = (double *)malloc(sizeof(double[no_ratio]));
    sizes = (unsigned long *)malloc(sizeof(long[no_sz]));

    for (i = 0; i < no_sz; i++)
        sizes[i] = min_sz + i * step_sz;
    for (i = 0; i < no_ratio; i++)
        ratios[i] = min_ratio + i * step_ratio;

    for (i = 0; i < no_sz; i++)
        for (j = 0; j < no_ratio; j++)
            run(i, j);

    printresults();
    return 0;
}
