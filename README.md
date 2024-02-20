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

## Presentations

### A conference 2024???

TODO ...

### RORO Melbourne - Thu 22 Feb 2024

✨ soon - be there 🫵 ✨

- https://www.meetup.com/ruby-on-rails-oceania-melbourne/events/297781308/#
- https://github.com/rubyaustralia/melbourne-ruby/issues/226

<img
    width="300"
    alt="failure_driven_rails_metal_cloud_metal_qr"
    src="https://github.com/failure-driven/rails-metal-cloud-metal/blob/7eeee51d2cd28772e2eada7ffba138675150effe/presentations/images/failure-driven_rails-metal-cloud-metal_git_qr.png">

### RORO Sydney - Tue 13 Feb 2024

✨ Hope you werre there 🎉 ✨

- https://lu.ma/13u979yj
- [**Presentation** - PRESENTATION_RAILS_APP_HOME_SERVER_LIGHTNING.md](
    presentations/PRESENTATION_RAILS_APP_HOME_SERVER_LIGHTNING.md
  )
- [**Code Samples** - experiments/in_rails_on_home_server](
    experiments/in_rails_on_home_server/
  )

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

