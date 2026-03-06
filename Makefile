SHELL=/bin/bash
DOCKER_REGISTRY ?= pi-2r
APP_NAME ?= copilot-cli
DOCKER_CMD ?= docker
COPILOT_CLI_VERSION ?= latest

.PHONY: all build clean

all: build

build:
	@echo "================================================================================"
	@echo "Building $(APP_NAME):$(COPILOT_CLI_VERSION)..."
	@echo "================================================================================"
	$(DOCKER_CMD) build \
		--build-arg COPILOT_CLI_VERSION=$(COPILOT_CLI_VERSION) \
		-t $(DOCKER_REGISTRY)/$(APP_NAME):$(COPILOT_CLI_VERSION) \
		-t $(DOCKER_REGISTRY)/$(APP_NAME):latest \
		.

clean:
	@$(DOCKER_CMD) image rm -f $$( $(DOCKER_CMD) image ls --format "{{.Repository}}:{{.Tag}}" --filter=reference="$(APP_NAME):*" ) 2>/dev/null || true
