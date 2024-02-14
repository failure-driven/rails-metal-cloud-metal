# Rails App on Home Server

you are running a rails app on a server at home and you want to serve it on the
internet ...

## AWS EC2

- create an AWS account
- start up an EC2 server
- add an allowed TCP connection on a port
- download the certificate to connect to it
- get it's public IP

```sh
# assuming ag and aws are installed
aws ec2 describe-instances --region us-east-1 | \
    jq '.Reservations[].Instances[] | {ImageId, KeyName, State, PublicIpAddress, PublicDnsName}'
```

- run a reverse ssh session

```sh
ssh -i "~/.ssh/metal-demo.pem" -R 8080:0.0.0.0:3000 ec2-user@XXX.XXX.XXX.XXX
```

- assuming you have a rails app running on port 3000 on your laptop

```sh
# from within the AWS EC2 container
curl http://0.0.0.0:8080
```

- **AND** you should see the response as well as a log message on your rails server

- and from a browser `open http://XXX.XXX.XXX.XXX:8080` something similar - but
  does not seem to work
  - seems there is something else preventing access to the EC2 instance? maybe
    there is some other setting?

## CloudFlare tunnels

- sign up to CloudFlare
- open up the dash https://dash.cloudflare.com/
- under **Websites** add a new website
- go to the site in the dash
- under **DNS** (_presumably they need to be the authority for the domain?_)
  - I did read somewhere that on a paid account you could have only a subdomain
    configured? but that also sounded expensive as it had to be a minimum of
    Business at $200/month - https://www.cloudflare.com/en-gb/plans/
  - anway, I had a domain hanging around that I transferred to CloudFlare - so
    far everything is free
- add a _NEW_ **DNS** setting similar to
  ```
  CNAME  metal-demo  111...999.cfargotunnel.com
  ```
  - where `metal-demo` was my sub domain to my example at
    https://metal-demo.pair-with.me/ and I think the rest may have come from a
    drop down
- leave the **Website** and go back to the root of the dash
- go to **Zero Trust** > **Network** > **Tunnel**
- create a tunnel to a private network
  - Public hostname: `metal-demo.pair-with.me`
  - Path: `*`
  - Service: `http://localhost:3000`
- there will also be a catchall rule `Catch-all rule: Content Loaded http_status:404`
- and instructions for running the **Cloudflare** daemon on your "home machine"
  ```
  brew install cloudflared && 

  sudo cloudflared service install eyJ...yJ9
  ```
  - or using docker
  ```
  docker run cloudflare/cloudflared:latest tunnel --no-autoupdate run --token eyJ...yJ9
  ```
- run that on your machine
- **Boom** 💥 - the internet can now get to your locally running service

