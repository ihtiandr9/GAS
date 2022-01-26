GCC=gcc 
RM=rm
OBJ = hellomain.s.o
BIN = hellomain
DIRSRC= .
all: clean ${BIN}

${BIN}: ${DIRSRC}/hellomain.s
	${GCC} -no-pie -g ${DIRSRC}/hellomain.s -o hellomain
clean:
	${RM} -f ${OBJ} ${BIN} ${map} *.lst
