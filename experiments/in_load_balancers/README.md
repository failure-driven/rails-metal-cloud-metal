# Load Balancers

**AIM:** run a load balancer which can switch between any number of apps and
fail over accordingly.

## TL;DR

```sh
make
make setup      # brew isntal haproxy etc and bundle install
make demo       # tmux open 3 simple servers and haproxy load balancer
make clean      # destroy the tmux session
```

## TMUX

* best if running in iterm2 with native window tmux integration
    * General -> tmux -> When attaching...: Native tabs in a new window
* if you get errors just run `make clean` a couple of times to make sure any
  stray sessions have been removed
