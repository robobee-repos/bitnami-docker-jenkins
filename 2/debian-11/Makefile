SHELL := /bin/bash
DOCKER_INFO_FILE := Docker.yaml
REPOSITORY := $(shell yq e ".repository" $(DOCKER_INFO_FILE))
TYPE := $(shell yq e ".type" $(DOCKER_INFO_FILE))
VERSION := $(shell if [[ -n "$(TYPE)" ]]; then echo "$(TYPE)-`yq e '.version' $(DOCKER_INFO_FILE)`"; else echo "`yq e '.version' $(DOCKER_INFO_FILE)`" ; fi)
NAME := $(shell yq e ".name" $(DOCKER_INFO_FILE))
BASE := ../..

.PHONY: info
info: ##@targets Shows the the docker image name.
	@echo $(REPOSITORY)/$(NAME):$(VERSION)

.PHONY: build
build: _build ##@targets Builds the docker image.

.PHONY: clean test_down_volumes
clean: _clean ##@targets Removes the local docker image.

.PHONY: deploy
deploy: _deploy ##@targets Deploys the docker image to the repository.

.PHONY: test-up
test-up: _test_up ##@targets Starts the application for a test.

.PHONY: test-down
test-down: _test_down ##@targets Stops the test application.

.PHONY: test-down-volumes
test-down-volumes: _test_down_volumes ##@targets Stops the test application and removes all named volumes.

include $(BASE)/utils/Makefile.help
include $(BASE)/utils/Makefile.functions
include $(BASE)/utils/Makefile.image
