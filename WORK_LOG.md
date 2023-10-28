# Work Log

## Sun 29 Oct 2023

basic Kamal setup

```sh
kamal setup     # assuming ssh and local user ssh is setup

  INFO [d1efe036] Running /usr/bin/env mkdir -p .kamal on localhost
  INFO [d1efe036] Finished in 0.111 seconds with exit status 0 (successful).
Acquiring the deploy lock...
Ensure Docker is installed...
  INFO [8fa15605] Running docker -v on localhost
  INFO [8fa15605] Finished in 0.005 seconds with exit status 127 (failed).
  INFO [5390fdc3] Running [ "${EUID:-$(id -u)}" -eq 0 ] on localhost
  INFO [5390fdc3] Finished in 0.004 seconds with exit status 1 (failed).
  INFO [4912d399] Running /usr/bin/env mkdir -p .kamal on localhost
  INFO [4912d399] Finished in 0.008 seconds with exit status 0 (successful).
```

unfortunately Kamal was not made to deploy on Mac just from mac

DHH - https://github.com/basecamp/kamal/issues/432#issuecomment-1722291423

## Fri 27 Oct 2023

### Starting with Capistrano

need to access server by SSH so even for localhost on mac need to setup
following:

> In **System Preferences** under **Sharing**, there is an option for **Remote
> Login**.

if you have the correct rights you can set this up on the command line

```sh
sudo systemsetup -setremotelogin on 

# use the System Preferences option above if you get the error
setremotelogin: Turning Remote Login on or off requires Full Disk Access privileges.
```

It might be easiest to add your SSH public key to authorised hosts not to have
to type it in every time you run the cap deploy script.

```sh
# go to ssh directory
cd ~/.ssh

# append your public key to the authorized_keys file
cat id_ed25519.pub >> authorized_keys
```

```sh
make demo-1-local-deploy
bundle exec cap production deploy
bundle exec cap production deploy:check
```

got following error so needed to add some keys

```sh
unsupported key type `ssh-ed25519' (NotImplementedError)
net-ssh requires the following gems for ed25519 support:
 * ed25519 (>= 1.2, < 2.0)
 * bcrypt_pbkdf (>= 1.0, < 2.0)
See https://github.com/net-ssh/net-ssh/issues/565 for more information
Gem::LoadError : "ed25519 is not part of the bundle. Add it to your Gemfile."
```

- [ ] TODO: does not start the app

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

