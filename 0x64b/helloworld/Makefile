GCC=gcc
CFLAGS= -fomit-frame-pointer -no-pie -g
RM=rm
OBJ = hellomain.s.o
BIN = hellomain
BIN2 = hellomain_no_bp_frame
BIN3 = sample
DIRSRC= .
all: clean ${BIN} ${BIN2} ${BIN3}

${BIN}: ${DIRSRC}/hellomain.s
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain.s -o hellomain
${BIN2}: ${DIRSRC}/hellomain_no_bp_frame.s
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain_no_bp_frame.s -o hellomain_no_bp_frame
${BIN3}: ${DIRSRC}/sample.c
	${GCC} ${CFLAGS} ${DIRSRC}/sample.c -S -o sample.c.s
	${GCC} ${CFLAGS} ${DIRSRC}/sample.c -o sample
clean:
	${RM} -f ${OBJ} ${BIN} ${BIN2} ${BIN3} ${map} *.lst *c.s
