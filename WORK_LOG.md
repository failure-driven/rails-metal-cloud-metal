# Work Log

## Fri 27 Oct 2023

### What is a golden SHA

The idea of a background worker that does something "useful" that we want our
Rails server to do during the demonstration as we deploy and redeploy the app,
and all the data (DB, images, jobs) between

    🤘metal🎸 - ☁️ cloud☁️  - 🤘metal🗡️

So why not create a "pseudo" blockchain of SHA256 values starting with 5
`00000`. The hash will be calculated with the following formula

```
index + previous hash + timestamp + data + nonce
```

the `nonce` is an incrementing number to reach the `00000` golden SHA

```sh
bin/demo-golden-shas-blockchain.rb --locked-time 0 'Genesis block'
{
  "index": 0,
  "previous_hash": "0",
  "timestamp": 0,
  "data": "Genesis block",
  "nonce": 992516,
  "hash": "00000a288df6681f7d3c2886e653cd93211bdb38d1aefcca7074b4f5dd8c1f93"
}
[{"index":0,"previous_hash":"0","timestamp":0,"data":"Genesis block","nonce":992516,"hash":"00000a288df6681f7d3c2886e653cd93211bdb38d1aefcca7074b4f5dd8c1f93"}]
```

which can be confirmed with unix commands

```sh
echo -n "000Genesis block992516" | shasum -a 256
00000a288df6681f7d3c2886e653cd93211bdb38d1aefcca7074b4f5dd8c1f93  -

echo -n '000Genesis block992516' | sha256sum
00000a288df6681f7d3c2886e653cd93211bdb38d1aefcca7074b4f5dd8c1f93  -

echo -n "000Genesis block992516" | openssl dgst -sha256
SHA2-256(stdin)= 00000a288df6681f7d3c2886e653cd93211bdb38d1aefcca7074b4f5dd8c1f93
```

and the command can be run with the `--locked-time <number>` option for
repeatability, or just run with time incrementing:

```sh
time bin/demo-golden-shas-blockchain.rb The quick brown fox jumps over the lazy dog

{
  "index": 0,
  "previous_hash": "0",
  "timestamp": 1698374055,
  "data": "The",
  "nonce": 154708,
  "hash": "000000d485c2b7fe9ac21af290ff282f5fdef61274b89baf7b4afc7ff689e035"
}
...
```

### The plan
Discuss goals between @saramic and @friendlyantz. The plan is something along
the lines of:

1. [x] `rails new`
    - https://github.com/failure-driven/golden-shas
    ```sh
    bin/rails server
    ```
1. [ ] run in production mode
    ```sh
    RAILS_ENV=production bin/rails server
    ```
1. [ ] Capistrano (https://github.com/capistrano/capistrano) deploy to local machine
1. [ ] Kamal (https://github.com/basecamp/kamal) deploy to local machine
    - ALSO use launchd/conf.d to restart if process is killed
1. [ ] ssh tunnel reverse proxy to Cloud Load Balancer OR EC2 instance with
   public IP address
    1. [ ] run a local load balancer HAProxy or NGINX
        - https://www.haproxy.org/
        - https://www.nginx.com/
1. [ ] deploy to another local machine linux box/ras pi
    1. [ ] via docker?
    1. [ ] via kubernetes?
    1. [ ] look at JRuby deploy?
    1. [ ] on GitHub Actions?
1. [ ] expand app to have DB, file storage and background jobs
1. [ ] DB and file storage separated from deploy (another machine, configured
   at deploy time)
    1. [ ] deploy to dark web .oninon address
1. [ ] Replication of DB/file storage between 2 machines, local Mac laptop and
   linux box
1. [ ] Kamal script to deploy node to AWS EC2, S3, RDS
    1. [ ] scripts to deploy to PaaS Heroku, Hatchbox, Fly, Render
    1. [ ] including replication from local metal
1. [ ] Multiple availability zones (Mutli AZ)
1. [ ] local hosted multiple availablity zones via home "sneakernet"

