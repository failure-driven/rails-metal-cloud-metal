# rails-metal-cloud-metal

How to host a rails app at home, move it to the cloud and back to on prem.

[![CI](
    https://github.com/failure-driven/rails-metal-cloud-metal/actions/workflows/ci.yml/badge.svg
    )](https://github.com/failure-driven/rails-metal-cloud-metal/actions/workflows/ci.yml)

## TL;DR

```sh
make
make install
make ci
make rspec
```

## Demos

### Demo 1

Rails app deployed locally (using capistrano)

```sh
make
make demo-1-local-deploy    # TODO not complete
make rspec                  # in future change to demo-1-test
# make clean
```

## Plan

loosely based on a conversation on [Ruby Australia #melb-meets Oct 5th Slack](https://rubyau.slack.com/archives/C010RUGPRHU/p1696480053027199?thread_ts=1696479747.231869&cid=C010RUGPRHU)

a guide for zero to hero and back again

- [ ] rails new
- [ ] add a DB, image storage and background processing
- [ ] run in production mode
- [ ] deploy locally - using capistrano and kamal
- [ ] deploy locally on docker
- [ ] host from home to the internet
- [ ] host on the dark web
- [ ] move to a cloud provider
- [ ] switch cloud providers
- [ ] ad multi availability zones (AZ)
- [ ] switch back to an on prem solution with redundancy
- [ ] review
    - [ ] what have we learnt?
    - [ ] cost comparison
    - [ ] smart deploy template?

## Experiments

- [Experiments in home lab cluster](./experiments/in_home_lab_cluster)
- [Experiments in load balancers](./experiments/in_load_balancers)

## Work Log

available at [./WORK_LOG.md](./WORK_LOG.md)

