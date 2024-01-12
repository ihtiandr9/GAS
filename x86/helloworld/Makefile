GCC=gcc
CFLAGS= -no-pie -g
RM=rm
BIN = hellomain
BIN2 = sample
DIRSRC= .
all: clean ${BIN} ${BIN2}

${BIN}: ${DIRSRC}/hellomain.s
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain.s -o hellomain

${BIN2}: ${DIRSRC}/sample.c
	${GCC} ${CFLAGS} ${DIRSRC}/sample.c -S -o sample.c.s
	${GCC} ${CFLAGS} ${DIRSRC}/sample.c -o sample
clean:
	${RM} -f ${OBJ} ${BIN} ${BIN2} ${map} *.lst *c.s
