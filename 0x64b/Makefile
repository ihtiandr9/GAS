SUBDIRS=factorial_iterative factorial_recursive helloworld

.PHONY: all clean ${SUBDIRS}

all: ${SUBDIRS}

${SUBDIRS}:
	make -C $@

clean:
	for dir  in ${SUBDIRS}; do \
		make clean -C $$dir; \
	done;
