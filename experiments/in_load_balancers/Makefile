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
	bundle

.PHONY: demo
demo:
	tmux -L "demo" new-session -d
	tmux -L "demo" new-window -d -n 1 -t "0:1"
	tmux -L "demo" send-keys -t "0:1" \
		"bundle exec rackup app-1/config.ru --port 9111 --server puma" Enter
	tmux -L "demo" split-window -t "0:1"
	tmux -L "demo" send-keys -t "0:1" \
		"bundle exec rackup app-2/config.ru --port 9222" Enter
	tmux -L "demo" split-window -t "0:1"
	tmux -L "demo" send-keys -t "0:1" \
		"bundle exec rackup app-3/config.ru --port 9333" Enter
	tmux -L "demo" select-layout -t "0:1" even-vertical
	tmux -L "demo" new-window -d -n 1 -t "0:2"
	tmux -L "demo" send-keys -t "0:2" \
		"haproxy -f config/haproxy_traffic_to_server.cfg -d" Enter
	tmux -L "demo" split-window -t "0:2"
	tmux -L "demo" send-keys -t "0:2" \
		"watch --interval 1 curl http://localhost:8080 --silent" Enter
	tmux -L "demo" -CC attach-session

.PHONY: tmux-down
tmux-down:
	@tmux -L "demo" kill-session || echo -e "${GREEN}no tmux running ✅${NC}"

.PHONY: debug
debug:
	@echo "are there any tmux sessions?"
	tmux -L "demo" list-sessions || echo "no sessions ❌"
	echo "are the servers listening?"
	lsof -nP -iTCP:9111 -sTCP:LISTEN || echo "app1 down ❌"
	lsof -nP -iTCP:9222 -sTCP:LISTEN || echo "app2 down ❌"
	lsof -nP -iTCP:9333 -sTCP:LISTEN || echo "app3 down ❌"
	echo "is haproxy listening?"
	lsof -nP -iTCP:8080 -sTCP:LISTEN || echo "haproxy down ❌"

.PHONY: clean
clean: tmux-down
	echo "clean"
	killall haproxy

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
	@echo "${YELLOW}make debug${NC}                    show what is up or down"
	@echo

