.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m
# versions
APP_REVISION    = $(shell git rev-parse HEAD)

.PHONY: setup
setup:
	brew bundle

.PHONY: demo
demo:
	@echo "demo goes here"


.PHONY: clean
clean:
	@echo "cleanup"

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "${YELLOW}make${NC}                          this usage information"
	@echo "${YELLOW}make setup${NC}                    install and set things up"
	@echo "${YELLOW}make demo${NC}                     run the demo"
	@echo "${YELLOW}make clean${NC}                    stop the demo and clean up"
	@echo

