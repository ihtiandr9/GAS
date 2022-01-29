PROJEKTDIR= ..
ifdef _DD_
DEBUG+= -D_DD_ -g
endif
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    MAKE=make
    elf_format=elf_i386
else
    MAKE=gmake
    elf_format=elf_i386_fbsd
endif

GCC=gcc -m64 -Wno-int-conversion -fno-stack-protector -fno-exceptions -fno-pic -O0 -Wa,-aslh ${DEBUG} -DKERNEL
LD=ld  -e _astart 
BIN = LOADER.BIN
OBJ = loader.S.o
##
RM  =rm

.PHONY: all clean

all: ${BIN}

${BIN}: ${OBJ}
	${LD}  ${OBJ} -o loader.out -lc -M > ldkern.map
	objcopy -O binary loader.out LOADER.BIN
	objdump -D -M i8086 loader.out > dump.tmp

bios_r.c.o: bios_r_c.S
	${GCC} -c -o bios_r.c.o  bios_r_c.S >bios_r_c.lst

bios_r_c.S: ${PROJEKTDIR}/bios/bios_r.c
	${GCC} -S -o bios_r_c.S.tmp ${PROJEKTDIR}/bios/bios_r.c -I.. > /dev/null
	sed -e '/align/d' -e '/nop/d' < bios_r_c.S.tmp > bios_r_c.S
	rm -f bios_r_c.S.tmp

bios_r.S.o: ${PROJEKTDIR}/bios/bios_r.S
	${GCC} -c -o bios_r.S.o ${PROJEKTDIR}/bios/bios_r.S >bios_r.S.lst

loader.S.o: loader.S
	${GCC} -c loader.S -o loader.S.o >loader.S.lst

ldkern.c.o: ldkern_c.S
	${GCC} -c -o ldkern.c.o ldkern_c.S > ldkern_c.lst

ldkern_c.S: ldkern.c ${PROJEKTDIR}/include/bios.h ${PROJEKTDIR}/include/fat/fat12.h
	${GCC} -S -I.. ldkern.c -o ldkern.c.tmp > /dev/null
	sed -e '/align/d' -e '/nop/d' < ldkern.c.tmp > ldkern_c.S
#	rm -f ldkern.c.tmp

clean:
	${RM} -f *.o *.out ${BIN} *.lst *.tmp *_c.S *.map
