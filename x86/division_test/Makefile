GCC=gcc
CFLAGS= -m32 -no-pie -g
RM=rm
BIN = division
DIRSRC= .
all: clean ${BIN}

${BIN}: ${DIRSRC}/division_${SIZE}.S
	${GCC} ${CFLAGS} ${DIRSRC}/division_${SIZE}.S -o division
clean:
	${RM} -f ${OBJ} ${BIN} ${BIN2} ${map} *.lst
