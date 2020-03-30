PREFIX?=mikhus

export DOCKER_CLI_EXPERIMENTAL := enabled

build:
	docker build -t $(PREFIX)/alpine-gzexe:latest .
