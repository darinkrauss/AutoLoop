ROOT_DIRECTORY:=$(realpath $(dir $(realpath $(lastword $(MAKEFILE_LIST)))))

.PHONY: default
default: all

.PHONY: all
all: setup

.PHONY: setup
setup:
	@cd $(ROOT_DIRECTORY) && \
		bin/setup.sh build/LoopWorkspace

.PHONY: clean
clean:
	@cd $(ROOT_DIRECTORY) && \
		rm -rf build
