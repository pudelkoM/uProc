#include "options.h"
#include <ctype.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <time.h>
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
    struct timespec ts = {};
    if (clock_gettime(CLOCK_MONOTONIC, &ts)) {
        perror("getting time");
        abort();
    }
    return (ts.tv_sec + ts.tv_nsec / 1.0e9);
}

static void check_valid_toupper(const char *func_name, const char *text, size_t len) {
    for (size_t i = 0; i < len; ++i) {
        if (text[i] != toupper(text[i])) {
            fprintf(stderr, "%s failed check at %zu: %c should be %c\n", func_name, i, text[i],
                    toupper(text[i]));
            abort();
        }
    }
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

static void toupper_library(char *text, size_t len) {
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

static void toupper_prefetch_branch(char *text, size_t len) {
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

static __m128i toupper_si128(__m128i src) {
    __m128i lowerarr = _mm_sub_epi8(src, _mm_set1_epi8('a' + 128));
    __m128i notlittle = _mm_cmpgt_epi8(lowerarr, _mm_set1_epi8(-128 + 25));

    __m128i flip = _mm_andnot_si128(notlittle, _mm_set1_epi8(0x20));

    return _mm_xor_si128(src, flip);
}

static void toupper_sse_1(char *text, size_t len) {
    int isnull;
    while (1) {
        __m128i sv = _mm_loadu_si128((const __m128i *)text);

        __m128i nullthere = _mm_cmpeq_epi8(_mm_setzero_si128(), sv);
        isnull = _mm_movemask_epi8(nullthere);

        if (isnull)
            break;

        __m128i upperc = toupper_si128(sv);

        _mm_storeu_si128((__m128i *)text, upperc);
        text += 16;
    };

    unsigned int bytes_left = ffs(isnull) - 1;

    if (bytes_left > 0) {
        for (unsigned int i = 0; i <= bytes_left; ++i) {
            if (text[i] >= 'a' && text[i] <= 'z')
                text[i] -= 0x20;
        }
    }
}

//static void toupper_sse_2(char *text, size_t len) {
//    for (size_t i = 0; i < len -16; i+= 16) {
//        __m128i sv = _mm_load_si128((const __m128i *)text);
//
//        __m128i upperc = toupper_si128(sv);
//
//        _mm_store_si128((__m128i *)text, upperc);
//        text += 16;
//    };
//
//    unsigned int bytes_left = (len % 16) - 1;
//
//    if (bytes_left > 0) {
//        for (unsigned int i = 0; i <= bytes_left; ++i) {
//            if (text[i] >= 'a' && text[i] <= 'z')
//                text[i] -= 0x20;
//        }
//    }
//}

static __m256i toupper_si256(__m256i src) {
    __m256i lowerarr = _mm256_sub_epi8(src, _mm256_set1_epi8('a' + 128));
    __m256i notlittle = _mm256_cmpgt_epi8(lowerarr, _mm256_set1_epi8(-128 + 25));

    __m256i flip = _mm256_andnot_si256(notlittle, _mm256_set1_epi8(0x20));

    return _mm256_xor_si256(src, flip);
}

static void toupper_avx_1(char *text, size_t len) {
    int isnull;
    while (1) {
		__m256i sv = _mm256_loadu_si256((const __m256i *)text);

        __m256i nullthere = _mm256_cmpeq_epi8(_mm256_setzero_si256(), sv);
        isnull = _mm256_movemask_epi8(nullthere);

        if (isnull)
            break;

		__m256i upperc = toupper_si256(sv);

		_mm256_storeu_si256((__m256i *) text, upperc);
		text +=32;
	}

    unsigned int bytes_left = ffs(isnull) - 1;

    if (bytes_left > 0) {
        for (unsigned int i = 0; i <= bytes_left; ++i) {
            if (text[i] >= 'a' && text[i] <= 'z')
                text[i] -= 0x20;
        }
    }
}

/*****************************************************************/

// align at 16byte boundaries
void *mymalloc(unsigned long int size) {
#if defined(_ISOC11_SOURCE)
    return aligned_alloc(16, size);
#else
    void *addr = malloc(size + 32);
    return (void *)((unsigned long int)addr / 16 * 16 + 16);
#endif
}

void myfree(void *ptr) {
#if defined(_ISOC11_SOURCE)
    free(ptr);
#else
    void *align_ptr = (void *)(((uintptr_t)ptr - 1) & ~0xfull);
    free(align_ptr);
#endif
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

void run_toupper(char *text, size_t len, int index, toupperfunc f, const char *name) {
    double start, stop;
    if (debug)
        printf("Before: %.40s...\n", text);

    start = gettime();
    (*f)(text, len);
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
    {"library", toupper_library},
    {"loop", toupper_loop},
    {"unroll", toupper_unroll},
    {"sse", toupper_sse_1},
	//{"sse_len", toupper_sse_2},
	{"avx", toupper_avx_1},
    {"prefetch", toupper_prefetch_branch},
    {NULL, NULL},
};

void run(int size, int ratio) {
    int v;
    char *text = init(sizes[size], ratios[ratio]);
    for (v = 0; toupperversion[v].func != 0; v++) {
        char *text_copy = mymalloc(sizes[size]);
        memcpy(text_copy, text, sizes[size]);
        int index = ratio + size * no_ratio + v * no_sz * no_ratio;
        run_toupper(text_copy, sizes[size], index, toupperversion[v].func, toupperversion[v].name);
        check_valid_toupper(toupperversion[v].name, text_copy, sizes[size]);
        myfree(text_copy);
    }
    myfree(text);
}

void printresults() {
    int i, j, k, index;
    printf("%s\n", OPTS);

    for (j = 0; j < no_sz; j++) {
        for (k = 0; k < no_ratio; k++) {
            printf("Size: %ld \tRatio: %f \tRunning time:\n", sizes[j], ratios[k]);
            for (i = 0; i < no_version; i++) {
                index = k;
                index += j * no_ratio;
                index += i * no_sz * no_ratio;
                printf("\t%-8s:\t%9.5f \n", toupperversion[i].name, results[index]);
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
