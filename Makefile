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

.PHONY: demo
demo:
	bin/demo-golden-shas-blockchain.rb \
	  'We the People of the United States,' \
	  'in Order to form a more perfect Union,' \
	  'establish Justice,' \
	  'insure domestic Tranquility,'

.PHONY: demo-1-local-deploy
demo-1-local-deploy:
	bundle exec cap production deploy

.PHONY: lint-safe
lint-safe:
	bundle exec rubocop -a

.PHONY: lint-unsafe
lint-unsafe:
	bundle exec rubocop -A

.PHONY: lint-checkonly
lint-checkonly:
	bundle exec rubocop

.PHONY: rspec
rspec:
	bundle exec rspec

.PHONY: ci
ci: lint-checkonly rspec

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "${YELLOW}make install${NC}                  install dependencies"
	@echo
	@echo "${YELLOW}make demo${NC}                     run DEMO script"
	@echo
	@echo "${YELLOW}make demo-1-local-deploy${NC}      demo 1: local deploy"
	@echo
	@echo "${YELLOW}make lint-safe${NC}                lint app(SAFE)"
	@echo "${YELLOW}make lint-unsafe${NC}              lint app(UNSAFE)"
	@echo "${YELLOW}make lint-checkonly${NC}           check lintintg"
	@echo "${YELLOW}make rspec${NC}                    run specs"
	@echo
	@echo "${YELLOW}make ci${NC}                       CI script"
	@echo

