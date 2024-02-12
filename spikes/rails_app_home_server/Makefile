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

.PHONY: install
install:
	bundle install

.PHONY: my-ip
my-ip:
	@echo "${GREEN}EXTERNAL 🌏${NC}\n\t"
	dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com
	@echo "\n${GREEN}INTERNAL 🏡${NC}\n\t"
	ipconfig getifaddr en0
	# ipconfig getifaddr en1

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "${YELLOW}make install${NC}                  install dependencies"
	@echo

