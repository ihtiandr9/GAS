GCC=gcc
CFLAGS= -fomit-frame-pointer -no-pie -g
RM=rm
OBJ = hellomain.s.o
BIN = hellomain
BIN2 = hellomain_no_bp_frame
BIN3 = hellomain_no_bp_frame_stderr
BIN4 = sample
DIRSRC= .
all: clean ${BIN} ${BIN2} ${BIN3} ${BIN4}


${BIN}: ${DIRSRC}/hellomain.s
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain.s -o hellomain

${BIN2}: ${DIRSRC}/hellomain_no_bp_frame.s
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain_no_bp_frame.s -o hellomain_no_bp_frame

${BIN3}: ${DIRSRC}/hellomain_no_bp_frame_stderr.s
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain_no_bp_frame_stderr.s -o hellomain_no_bp_frame_stderr


${BIN4}: ${DIRSRC}/sample.c
	${GCC} ${CFLAGS} ${DIRSRC}/sample.c -S -o sample.c.s
	${GCC} ${CFLAGS} ${DIRSRC}/sample.c -o sample
clean:
	${RM} -f ${OBJ} ${BIN} ${BIN2} ${BIN3} ${BIN4} ${map} *.lst *c.s
