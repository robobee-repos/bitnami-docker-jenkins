REPOSITORY := robobeerun
NAME := bitnami-jenkins
VERSION ?= 2.319.2-debian-10-r13-r1
BASE := .

.PHONY: build
build: ##@targets Builds the docker image.
	$(MAKE) -C 2/debian-10 $@

.PHONY: clean test_down_volumes
clean: ##@targets Removes the local docker image.
	$(MAKE) -C 2/debian-10 $@

.PHONY: deploy
deploy: ##@targets Deploys the docker image to the repository.
	$(MAKE) -C 2/debian-10 $@ 

.PHONY: test_up
test_up: ##@targets Starts the application for a test.
	$(MAKE) -C 2/debian-10 $@ 

.PHONY: test_down
test_down: ##@targets Stops the test application.
	$(MAKE) -C 2/debian-10 $@ 

.PHONY: test_down_volumes
test_down_volumes: ##@targets Stops the test application and removes all named volumes.
	$(MAKE) -C 2/debian-10 $@ 

include $(BASE)/utils/Makefile.help
include $(BASE)/utils/Makefile.functions
include $(BASE)/utils/Makefile.image
