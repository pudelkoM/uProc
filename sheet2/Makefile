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

#############################################################################################


exe: .autoclean $(VARIANTS) Makefile
	if test -f ./$(PROGRAM)_variant1; then ./$(PROGRAM)_variant1 $(PARAMS) > results1;else rm -f results1; fi
	if test -f ./results1; then cat results1 > results; else rm -f results; fi
	cat results;

$(PROGRAM)_variant1: $(sources) Makefile
	$($(PROGRAM)_variant1) -S -o $(PROGRAM)_variant1.s
	$($(PROGRAM)_variant1) -o $(PROGRAM)_variant1

.autoclean: Makefile
	make clean
	touch .autoclean

.PHONY: clean
clean:
	rm -f *_variant* results*