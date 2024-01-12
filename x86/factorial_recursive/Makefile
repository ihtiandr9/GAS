GCC=gcc
CFLAGS= -no-pie -g
RM=rm
BIN = hellomain
DIRSRC= .
all: clean ${BIN} ${BIN2}

${BIN}: ${DIRSRC}/hellomain.s
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain.s -o hellomain
clean:
	${RM} -f ${OBJ} ${BIN} ${BIN2} ${map} *.lst
