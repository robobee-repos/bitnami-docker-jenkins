BASE := .

.PHONY: info
info: ##@targets Shows the the docker image name.
	$(MAKE) -C 2/debian-10 $@

.PHONY: build
build: ##@targets Builds the docker image.
	$(MAKE) -C 2/debian-10 $@

.PHONY: clean test_down_volumes
clean: ##@targets Removes the local docker image.
	$(MAKE) -C 2/debian-10 $@

.PHONY: deploy
deploy: ##@targets Deploys the docker image to the repository.
	$(MAKE) -C 2/debian-10 $@ 

.PHONY: test-up
test-up: ##@targets Starts the application for a test.
	$(MAKE) -C 2/debian-10 $@ 

.PHONY: test-down
test-down: ##@targets Stops the test application.
	$(MAKE) -C 2/debian-10 $@ 

.PHONY: test-down-volumes
test-down-volumes: ##@targets Stops the test application and removes all named volumes.
	$(MAKE) -C 2/debian-10 $@ 

include $(BASE)/utils/Makefile.help
