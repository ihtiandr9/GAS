GCC=gcc
CFLAGS= -no-pie -ggdb
RM=rm
OBJ = hellomain.s.o
BIN = hellomain
DIRSRC= .
all: clean ${BIN}

${BIN}: ${DIRSRC}/hellomain.s
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain.s -o hellomain
clean:
	${RM} -f ${OBJ} ${BIN} ${map} *.lst
