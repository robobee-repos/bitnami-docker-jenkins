REPOSITORY := robobeerun
NAME := bitnami-jenkins
VERSION ?= 2.319.2-debian-10-r13-r1
BASE := ../..

.PHONY: build
build: _build ##@targets Builds the docker image.

.PHONY: clean test_down_volumes
clean: _clean ##@targets Removes the local docker image.

.PHONY: deploy
deploy: _deploy ##@targets Deploys the docker image to the repository.

.PHONY: test_up
test_up: _test_up ##@targets Starts the application for a test.

.PHONY: test_down
test_down: _test_down ##@targets Stops the test application.

.PHONY: test_down_volumes
test_down_volumes: _test_down_volumes ##@targets Stops the test application and removes all named volumes.

include $(BASE)/utils/Makefile.help
include $(BASE)/utils/Makefile.functions
include $(BASE)/utils/Makefile.image
