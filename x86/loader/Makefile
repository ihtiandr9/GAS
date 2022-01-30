PROJEKTDIR= ..

DEBUG+= -D_DD_ -g

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    MAKE=make
    elf_format=elf_i386
else
    MAKE=gmake
    elf_format=elf_i386_fbsd
endif

GCC=gcc -m32 -Wno-int-conversion -fno-stack-protector -fno-exceptions -fno-pic -O0 -Wa,-aslh ${DEBUG} -DKERNEL
LD=ld  -e _start 
BIN = LOADER.BIN
OBJ = loader.S.o
##
RM  =rm

.PHONY: all clean

all: ${BIN}

${BIN}: ${OBJ}
	${LD}  -m${elf_format} ${OBJ} -o loader.out -lc -M > ldkern.map
##	${GCC} -o loader.out loader.S
##	objcopy -O binary loader.out LOADER.BIN
##	objdump -D -M i8086 loader.out > dump.tmp

loader.S.o: loader.S
	${GCC} -c loader.S -o loader.S.o >loader.S.lst

ldkern.c.o: ldkern_c.S
	${GCC} -c -o ldkern.c.o ldkern_c.S > ldkern_c.lst

clean:
	${RM} -f *.o *.out ${BIN} *.lst *.tmp *_c.S *.map
