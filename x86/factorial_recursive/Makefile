GCC=gcc
CFLAGS= -no-pie -g
RM=rm
OBJ = hellomain.s.o
BIN = hellomain
BIN2 = hellomain_no_bp_frame
DIRSRC= .
all: clean ${BIN} ${BIN2}

${BIN}: ${DIRSRC}/hellomain.s
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain.s -o hellomain
${BIN2}: ${DIRSRC}/hellomain_no_bp_frame.s
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain_no_bp_frame.s -o hellomain_no_bp_frame
clean:
	${RM} -f ${OBJ} ${BIN} ${BIN2} ${map} *.lst
