all: build run

mainFile = main

.PHONY: build
build:
	dart2native main.dart -o main

.PHONY: run
run:
	./$(mainFile)
