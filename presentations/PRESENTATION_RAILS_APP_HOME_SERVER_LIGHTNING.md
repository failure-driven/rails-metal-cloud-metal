# Can I host a rails app from a home server?

💎 🛤️  🏠

---

# Can I host a rails app from a home server?

```ruby
rails new
bin/rails server
bin/rails server RAILS_ENV=production ?????
```

---

## Demo

```
open http://...
stop server
http://... # reload
start server
http://... # reload
please clap 👏
```

---

## But Why?

---

## We have PaaS

- Heroku
- Fly.io
- Render
- Hatchbox

---

## And Cloud ☁️

- DigitalOcean Droplets
- Engine Yard
- Cloud66
- AWS AppRunner on AWS Fargate
- Linode ¯\_(ツ)_/¯

---

## So why run a home server?

- because I can

---

## So why run a home server?

- because I can
- because Anton asked

@friendlyantz - Ruby AU slack Oct 5
> Keen to hear about these topics(hope it inspires someone):

>   - Self hosting ruby app

---

## So why run a home server?

- because I can
- because Anton asked
- becasue I want devops skills

---

## So why run a home server?

- because I can
- because Anton asked
- becasue I want devops skills
- because internet like it's 1999

https://ghuntley.com/internet/

---

## So why run a home server?

- because I can
- because Anton asked
- becasue I want devops skills
- because internet like it's 1999
- because I want to create a threat map

---

## So why run a home server?

- because I can
- because Anton asked
- becasue I want devops skills
- because internet like it's 1999
- because I want to create a threat map
- because it's cheaper?

---

## So why run a home server?

### cost saving

RECLAIM THE STACK!
https://reclaim-the-stack.com/

> We spent 7 months building a Kubernetes based platform to replace Heroku. The
> results were a 90% reduction in costs and a 30% improvement in performance.

---

## So why run a home server?

### cost saving

KAMAL formerly MRSK
https://kamal-deploy.org/

> Leaving the cloud will save us $7 million over five years.
> https://basecamp.com/cloud-exit

---

## So why run a home server?

### cost saving

- https://twitter.com/dhh/status/1755600973492564067
> @dhh
> Oh it’s coming. Physical distribution of self-hosted systems are a great
> idea. But we can do more than just ship you the media, we can send you
> the whole computer! (Pi 5s run Campfire great!)

https://twitter.com/dhh/status/1753436194753704313
> @dhh
> Don't let anyone tell you that it's too hard or too scary to run a
> server on the internet. It's never been easier or safer.  You don't need
> a vendor.

---

## So why run a home server?

### Custom hardware

> At one time I was looking at using a hardware module, a QRNG (Quantum Random
> Number Generator) to do our own true random numbers at Gleam. Getting that
> shit in to a rack and managed is pretty pricey. So we considered running it
> from someone’s house instead.

John Sherwood @ponny (gleam.io)

https://www.idquantique.com/random-number-generation/products/quantis-random-number-generator/

---

## So why run a home server?

### Custom hardware

> Introducing the Dice-O-Matic mark II, now generating the die rolls on
> GamesByEmail.com. It is a 7 foot tall, 104 pound, dice-eating monster,
> capable of generating 1.3 million rolls a day.

gamesbyemail.com

---

## So why run a home server?

### Custom hardware

- large data
- fast machines
- custom hardware - bable of cell phones

---

## So why run a home server?

1. I can
1. Anton asked
1. I want devops skills
1. internet like it's 1999
1. I want to create a threat map
1. it's cheaper?
1. large data
1. fast machines
1. custom hardware - bable of cell phones, QRNG

---

## Warning

- https://darknetdiaries.com/transcript/86

> But he looked at where the site was hosted and it was hosted on a residential
> IP address. Hm, it seemed like this LinkedIn site reliability engineer was
> running a web server out of his house. This means there are open ports from
> the internet into his computers. The hacker thought well, hm, if I can get
> into this engineer’s home computer, this might give me a way into LinkedIn.

---

## What's involved

- do you have a public IP?

```sh
open https://whatismyipaddress.com/

ipconfig getifaddr en0 # wireless
ipconfig getifaddr en1 # ethernet

dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com # public

make my-ip
```

---

## What's going on?

- https://en.wikipedia.org/wiki/Carrier-grade_NAT

> With CGNAT, end sites, in particular residential networks, are configured
> with private network addresses that are translated to public IPv4 addresses
> by middlebox network address translator devices embedded in the network
> operator's network, permitting the sharing of small pools of public addresses
> among many end users. This essentially repeats the traditional
> customer-premise NAT function at the ISP level.

> Carrier-grade NAT is often used for mitigating IPv4 address exhaustion.

---

## Escaping CGNAT

AWS EC2 with public IP address

- IP
- traffic
- reverse SSH

---

## Why not run it on EC2?

- instance size
- QRNG
- huge DB
- dice-o-matic

---

## Escaping CGNAT

what about Cloudflare tunnel

- demo

---

## What's next

- Mac OS deploy - launchd

---

## What's next

- Mac OS deploy - launchd
- Docker

---

## What's next

- Mac OS deploy - launchd
- Docker
- Kamal - _requires docker_

---

## What's next

- Mac OS deploy - launchd
- Docker
- Kamal - _requires docker_
- Capistrano - _requires SSH_

---

## What's next

- Mac OS deploy - launchd
- Docker
- Kamal - _requires docker_
- Capistrano - _requires SSH_
- Ras Pi

---

## What's next

- Mac OS deploy - launchd
- Docker
- Kamal - _requires docker_
- Capistrano - _requires SSH_
- Ras Pi
- to Cloud

---

## What's next

- Mac OS deploy - launchd
- Docker
- Kamal - _requires docker_
- Capistrano - _requires SSH_
- Ras Pi
- to Cloud
- to On-prem cluster - _Zimablade_

---

## What's next

- Mac OS deploy - launchd
- Docker
- Kamal - _requires docker_
- Capistrano - _requires SSH_
- Ras Pi
- to Cloud
- to On-prem cluster - _Zimablade_
- 🤘metal🎸 - ☁️ cloud☁️  - 🤘metal🗡️
    - https://github.com/failure-driven/rails-metal-cloud-metal

---

## What's next

- Mac OS deploy - launchd
- Docker
- Kamal - _requires docker_
- Capistrano - _requires SSH_
- Ras Pi
- to Cloud
- to On-prem cluster - _Zimablade_
- 🤘metal🎸 - ☁️ cloud☁️  - 🤘metal🗡️
    - https://github.com/failure-driven/rails-metal-cloud-metal

- give slides support for imgcat

---

## Thank-you

Michael Milewski - @saramic

https://github.com/failure-driven/rails-metal-cloud-metal

