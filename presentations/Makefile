.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: images
images:
	bin/makefile/show-images.sh

.PHONY: slides-roro-melb
slides-roro-melb:
	npm install && npm run dev

.PHONY: slides-roro-syd
slides-roro-syd:
	slides PRESENTATION_RAILS_APP_HOME_SERVER_LIGHTNING.md

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make slides-roro-melb${NC}           reveal.js slides inside vite"
	@echo "${YELLOW}make slides-roro-syd${NC}            brew slides"
	@echo "${YELLOW}make images${NC}                     images for slides - because"
	@echo

