.PHONY:exe 

PROGRAM = stride
SHELL := /bin/sh

sources = $(PROGRAM).c

VARIANTS = $(PROGRAM)_variant1


CC = gcc
# CC = icc -fsource-asm -fno-alias -lm 
#CC = clang

CFLAGS = -march=native -Wall -std=gnu11 -fomit-frame-pointer -lm
CFLAGS_DEBUG = -march=native -Wall -std=gnu11 -fno-omit-frame-pointer -fsanitize=address -g -lm

$(PROGRAM)_variant1 = $(CC) $(CFLAGS) -O3 $(sources)
$(PROGRAM)_variant_max = $(CC) $(CFLAGS) -O3 stride-max.c
$(PROGRAM)_variant_max_debug = $(CC) $(CFLAGS_DEBUG) -O1 stride-max.c

#############################################################################################


exe: .autoclean $(VARIANTS) Makefile
	if test -f ./$(PROGRAM)_variant1; then ./$(PROGRAM)_variant1 $(PARAMS) > results1;else rm -f results1; fi
	if test -f ./results1; then cat results1 > results; else rm -f results; fi
	cat results;

$(PROGRAM)_variant1: $(sources) Makefile
	$($(PROGRAM)_variant1) -S -o $(PROGRAM)_variant1.s
	$($(PROGRAM)_variant1) -o $(PROGRAM)_variant1

$(PROGRAM)_variant_max: stride-max.c Makefile
	$($(PROGRAM)_variant_max) -S -o $(PROGRAM)_variant_max.s
	$($(PROGRAM)_variant_max) -o $(PROGRAM)_variant_max

$(PROGRAM)_variant_max_debug: stride-max.c Makefile
	$($(PROGRAM)_variant_max_debug) -S -o $(PROGRAM)_variant_max_debug.s
	$($(PROGRAM)_variant_max_debug) -o $(PROGRAM)_variant_max_debug

.autoclean: Makefile
	make clean
	touch .autoclean

.PHONY: clean
clean:
	rm -f *_variant* results*
