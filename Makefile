.PHONY: build pull from_image to_image unittest

DOCKER ?= $(shell which docker)

FROM_IMAGE  ?= opendilab/ding:nightly
CACHE_IMAGE ?=
TO_IMAGE    ?= opendilab/miniwob-plusplus
SCRIPT      ?= ding.Dockerfile
BROWSER     ?= chrome

pull:
	$(DOCKER) pull ${FROM_IMAGE}

build:
	$(DOCKER) build \
		--build-arg FROM_IMAGE=${FROM_IMAGE} \
		--build-arg BROWSER=${BROWSER} \
		$(if ${CACHE_IMAGE},--cache-from ${CACHE_IMAGE},) \
		-f ${SCRIPT} \
		-t ${TO_IMAGE} \
		.

from_image:
	@echo ${FROM_IMAGE}

to_image:
	@echo ${TO_IMAGE}

unittest:
	$(DOCKER) run ${TO_IMAGE} pytest --timeout=20
