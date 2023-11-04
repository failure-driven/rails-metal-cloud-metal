# Public IP Address

**AIM:** many home network providers no longer give you a public IP address as customers are behind [CGNAT](https://en.wikipedia.org/wiki/Carrier-grade_NAT), a Carrier Grade Network Address Translation layer. Get a Public IP address and forward traffic back into your home.

## TL;DR

```sh
make
make setup      # brew instal aws or digitalocean or similar tools
make demo       # fire up a public IP and access a server
make clean      # clean up
```

## Manual run through

make sure `aws` command line app is installed

```sh
make setup
```

and configured

```sh
aws configure

aws configure list

          Name                    Value             Type    Location
          ----                    -----             ----    --------
       profile                <not set>             None    None
    access_key     ****************XXXX shared-credentials-file
    secret_key     ****************YYYY shared-credentials-file
        region           ap-southeast-2      config-file    ~/.aws/config
```

create an instance

- create
- create a `pem` key

list instances

```sh
aws ec2 describe-instances
aws ec2 describe-instances | \
    jq '.Reservations[].Instances[] | {ImageId, KeyName, State, PublicIpAddress, PublicDnsName}'
aws ec2 describe-instances --region us-east-1 | \
    jq '.Reservations[].Instances[] | {ImageId, KeyName, State, PublicIpAddress, PublicDnsName}'

aws ec2 describe-instances --region us-east-1 \
    --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"
```

start an instance

connect to an instance

```sh
ssh -i "~/.ssh/demo.pem" -R 8080:0.0.0.0:9292 ec2-user@ec2-XXX-YYY-ZZZ-AAA.ap-southeast-2.compute.amazonaws.com

# from EC2
curl http://0.0.0.0:8080
# will fetch from localhost 9292

```

Allow an incoming port 80 or 8080
- Security Groups -> Inbound Rules -> HTTP 80 or TCP 8080

stop an instance
```sh
aws ec2 terminate-instances --region us-east-1 --instance-ids i-063080ea46f052408
```

delete an instance

