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
	@docker ps && \
		echo "\n\tdocker running, ${GREEN}good to demo ✅${NC}" || \
		echo "\n\tdocker not running, ${RED}start docker first ❌${NC}"

.PHONY: demo
demo:
	@echo "setting up traefik"
	docker-compose up -d reverse-proxy
	@echo "1 whoami server"
	docker-compose up -d whoami
	sleep 1
	@echo "fetch 3 times"
	for number in 1 2 3 ; do \
		curl -s -H Host:whoami.docker.localhost http://127.0.0.1 | \
		ag Hostname ; sleep 1; \
	done
	@echo "scale to 2 whoami servers"
	sleep 2
	docker-compose up -d --scale whoami=2
	@echo "fetch 3 times"
	for number in 1 2 3 ; do \
		curl -s -H Host:whoami.docker.localhost http://127.0.0.1 | \
		ag Hostname ; sleep 1;\
	done

.PHONY: clean
clean:
	echo "clean"
	docker-compose down

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make${NC}                          this usage information"
	@echo "${YELLOW}make setup${NC}                    install and set things up"
	@echo "${YELLOW}make demo${NC}                     run the demo"
	@echo "${YELLOW}make clean${NC}                    stop the demo and clean up"
	@echo

