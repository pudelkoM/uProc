#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sys/time.h>
#include "options.h"
#include <immintrin.h>


int debug = 0;
double *results;
double *ratios;
unsigned long   *sizes;

int no_sz = 1, no_ratio =1, no_version=1;



static inline
double gettime(void) {
	struct timeval tv;
  	gettimeofday(&tv, NULL);
	return ( tv.tv_sec + tv.tv_usec / 1000000.0);
}

__m128i toupper_si128(__m128i src) {
    __m128i lowerarr = _mm_sub_epi8(src, _mm_set1_epi8('a'+128));
    __m128i notlittle   = _mm_cmpgt_epi8(lowerarr, _mm_set1_epi8(-128 + 25));

    __m128i flip  = _mm_andnot_si128(notlittle, _mm_set1_epi8(0x20));

    return          _mm_xor_si128(src, flip);
}


static void toupper_simple(char * text) {

	while (*text) {
		if (*text >= 'a' && *text <= 'z') *text -= 0x20;
		text++;
	}
}

static void toupper_optimised(char * text) {
    int isnull;
    while(1) {
        __m128i sv = _mm_loadu_si128( (const __m128i*)text );

        __m128i nullthere = _mm_cmpeq_epi8(_mm_setzero_si128(), sv);
        isnull = _mm_movemask_epi8(nullthere);

        if (isnull)
            break;

        __m128i upperc = toupper_si128(sv);

        _mm_storeu_si128((__m128i*)text, upperc);
        text += 16;
    };

    unsigned int bytes_left = ffs(isnull) - 1;
    const char* last_byte = text + bytes_left;

    if (bytes_left > 0) {
            for (unsigned int i = 0 ; i <= bytes_left ; ++i) {
        		if (text[i] >= 'a' && text[i] <= 'z') text[i] -= 0x20;
            }
    }
}


/*****************************************************************/


// align at 16byte boundaries
void* mymalloc(unsigned long int size)
{
     void* addr = malloc(size+32);
     return (void*)((unsigned long int)addr /16*16+16);
}

char createChar(int ratio){
	char isLower = rand()%100;

	// upper case=0, lower case=1
	if(isLower < ratio)
		isLower =0;
	else
		isLower = 1;

	char letter = rand()%26+1; // a,A=1; b,B=2; ...

	return 0x40 + isLower*0x20 + letter;

}

char * init(unsigned long int sz, int ratio){
    int i=0;
    char *text = (char *) mymalloc(sz+1);
    srand(1);// ensures that all strings are identical
    for(i=0;i<sz;i++){
			char c = createChar(ratio);
			text[i]=c;
	  }
    text[i] = '\0';
    return text;
}



/*
 * ******************* Run the different versions **************
 */

typedef void (*toupperfunc)(char *text);

void run_toupper(int size, int ratio, int version, toupperfunc f, const char* name)
{
   double start, stop;
		int index;

		index =  ratio;
		index += size*no_ratio;
		index += version*no_sz*no_ratio;

    char *text = init(sizes[size], ratios[ratio]);


    if(debug) printf("Before: %.40s...\n",text);

    start = gettime();
    (*f)(text);
    stop = gettime();
    results[index] = stop-start;

    if(debug) printf("After:  %.40s...\n",text);
}

struct _toupperversion {
    const char* name;
    toupperfunc func;
} toupperversion[] = {
    { "simple",    toupper_simple },
    { "optimised", toupper_optimised },
    { 0,0 }
};


void run(int size, int ratio)
{
	int v;
	for(v=0; toupperversion[v].func !=0; v++) {
		run_toupper(size, ratio, v, toupperversion[v].func, toupperversion[v].name);
	}

}

void printresults(){
	int i,j,k,index;
	printf("%s\n", OPTS);

	for(j=0;j<no_sz;j++){
		for(k=0;k<no_ratio;k++){
			printf("Size: %ld \tRatio: %f \tRunning time:", sizes[j], ratios[k]);
			for(i=0;i<no_version;i++){
				index =  k;
				index += j*no_ratio;
				index += i*no_sz*no_ratio;
				printf("\t%s: %f", toupperversion[i].name, results[index]);
			}
			printf("\n");
		}
	}
}

int main(int argc, char* argv[])
{
    unsigned long int min_sz=800000, max_sz = 0, step_sz = 10000;
		int min_ratio=50, max_ratio = 0, step_ratio = 1;
		int arg,i,j,v;
		int no_exp;

		for(arg = 1;arg<argc;arg++){
			if(0==strcmp("-d",argv[arg])){
				debug = 1;
			}
			if(0==strcmp("-l",argv[arg])){
					min_sz = atoi(argv[arg+1]);
					if(arg+2>=argc) break;
					if(0==strcmp("-r",argv[arg+2])) break;
					if(0==strcmp("-d",argv[arg+2])) break;
					max_sz = atoi(argv[arg+2]);
					step_sz = atoi(argv[arg+3]);
			}
			if(0==strcmp("-r",argv[arg])){
					min_ratio = atoi(argv[arg+1]);
					if(arg+2>=argc) break;
					if(0==strcmp("-l",argv[arg+2])) break;
					if(0==strcmp("-d",argv[arg+2])) break;
					max_ratio = atoi(argv[arg+2]);
					step_ratio = atoi(argv[arg+3]);
			}

		}
    for(v=0; toupperversion[v].func !=0; v++)
		no_version=v+1;
		if(0==max_sz)  no_sz =1;
		else no_sz = (max_sz-min_sz)/step_sz+1;
		if(0==max_ratio)  no_ratio =1;
		else no_ratio = (max_ratio-min_ratio)/step_ratio+1;
		no_exp = v*no_sz*no_ratio;
		results = (double *)malloc(sizeof(double[no_exp]));
		ratios = (double *)malloc(sizeof(double[no_ratio]));
		sizes = (long *)malloc(sizeof(long[no_sz]));

		for(i=0;i<no_sz;i++)
			sizes[i] = min_sz + i*step_sz;
		for(i=0;i<no_ratio;i++)
			ratios[i] = min_ratio + i*step_ratio;

		for(i=0;i<no_sz;i++)
			for(j=0;j<no_ratio;j++)
				run(i,j);

		printresults();
    return 0;
}
