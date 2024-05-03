GCC=gcc
CFLAGS= -m32 -no-pie -ggdb
RM=rm
BIN = hellomain
BIN2 = sample
BUILD_DIR= build
DIRSRC= ./src
all: clean ${BIN} ${BIN2}

${BIN}: ${DIRSRC}/hellomain.s ${BUILD_DIR}
	${GCC} ${CFLAGS} ${DIRSRC}/hellomain.s -o ${BUILD_DIR}/hellomain

${BIN2}: ${DIRSRC}/sample.c ${BUILD_DIR}
	${GCC} ${CFLAGS} ${DIRSRC}/sample.c -S -o ${BUILD_DIR}/sample.c.s
	${GCC} ${CFLAGS} ${DIRSRC}/sample.c -o  ${BUILD_DIR}/sample
clean:
	${RM} -f ${OBJ} ${BIN} ${BIN2} ${map} *.lst *c.s
