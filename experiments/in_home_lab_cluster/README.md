# Home Lab Cluster

**AIM:** can 2 or more people, get together and build personal "home lab"
clusters that they serve up as a cloud offering to run people's rails projects?
as a sort of PaaS (Platform as a Service)?

## Hardware

There are many options but it is likely that a relatively cheap and small
server that can run docker is about right. There are NAS (Network Attached
Storage) controllers that can run docker which would be able to provide some
basic compute as well as storage. Then there are single board computers like
the infamous Raspberry Pi (RasPi) which in theory everyone has 1 kicking around
somewhere. There has always been a bit of a "Home Lab" push for a desktop
cluster with the latest entrant being the
[ZimaBlade](https://www.zimaboard.com/blade/). But ultimately it would be best
if the hardware choice was as flexible as an old laptop laying around or a
cheap refurbished mini desktop computer or even a compute stick like the
[SC8-PRO](https://www.scorptec.com.au/product/branded-systems/pc-stick/95422-sc8-pro)

### Options

- Pico 3 as a cluster https://www.picocluster.com/collections/pico-3
- RasPi cluster
    - https://rpi4cluster.com/
    - [Install Docker Engine on Raspberry Pi OS (32-bit)](
        https://docs.docker.com/engine/install/raspberry-pi-os/)
    - [Installing Docker on the Raspberry Pi](
        https://pimylifeup.com/raspberry-pi-docker/)
    - [Here's How to Install Docker on Raspberry Pi?](
        https://www.simplilearn.com/tutorials/docker-tutorial/raspberry-pi-docker)
    - [Building a Raspberry Pi cluster with Docker Swarm](
        https://medium.com/@henrique.menezes/building-a-raspberry-pi-cluster-with-docker-swarm-b457fb2f61a1)
    - [Lessons learned building a Raspberry Pi cluster](
        https://octopus.com/blog/raspberry-pi-cluster-lessons-learned)
    - [Building an 8 Node Raspberry Pi 4 Cluster (with Docker Swarm)](
        https://aricodes.net/posts/building-a-pi-cluster/)
    - [Build a Raspberry Pi 4 Docker Swarm Cluster with four nodes and deploy Traefik with Portainer](
        https://florianmuller.com/build-a-raspberry-pi-4-docker-swarm-cluster-with-four-nodes-and-deploy-traefik-with-portainer)
    - [How to setup Docker Swarm Cluster on Raspberry Pi](
        https://dockerlabs.collabnix.com/beginners/install/raspberrypi3/setting-up-swarm-cluster.html)
    - [How to Run a Raspberry Pi Cluster with Docker Swarm](
        https://howchoo.com/docker/how-to-run-a-raspberry-pi-cluster-with-docker-swarm/)
- [Refurb] HP ELITEDESK 800 G3 Micro i5-6500T 8GB RAM 256 SSD Wi-Fi $141.55
    - https://www.ozbargain.com.au/node/767189
    - HP ELITEDESK 800 G3 Micro i5-7500T 8/16GB RAM 256/512GB/1TB SSD Desktop
      PC WiFi $159
      - https://www.ebay.com.au/itm/256034187761
- Dell Optiplex
- LinkStar-H68K-1432 Router - runs docker
    - https://www.seeedstudio.com/LinkStar-H68K-1432-p-5501.html
- a bunch of NAS also runs docker
    - eg Synology NAS
    - https://mariushosting.com/can-i-run-docker-on-my-synology-nas/
- zimablade
    - https://www.crowdsupply.com/icewhale-technology/zimablade
- zimaboard
    - https://shop.zimaboard.com/
- Nvidia Jetson
    - https://en.wikipedia.org/wiki/Nvidia_Jetson
- Intel NUC
    - https://www.intel.com/content/www/us/en/products/details/nuc.html
- compute sticks
    - [SC8-PRO](https://www.scorptec.com.au/product/branded-systems/pc-stick/95422-sc8-pro)
    - [Intel computestick](https://screencloud.com/learn/guide-intel-compute-stick)
        - https://www.intel.com/content/www/us/en/products/sku/86612/intel-compute-stick-stck1a32wfc/specifications.html
    - [Asus Chromebit](https://www.amazon.com/CHROMEBIT-Stick-Desktop-RockChip-3288-C-LPDDR3L/dp/B0181JTPCU/)

### Comparison

| Name                  | Specs | Price | Notes |
| --------------------- | ----- | ----- | ----- |
| RasPi 5               | Broadcom BCM2712 quad-core<br>Arm Cortex A76 processor @ 2.4GHz<br>4GB/8GB RAM                         | ? | ? |
| LinkStar H68K         | Rockchip RK3568 for up to 2.0GHz<br>Quad-core 64-bit Cortex-A55<br>ARM G52 2EE<br>4GB<br>Android 11 OS | ? | ? |
| Intel Computestick    | Intel Atom® Processor Z3735F<br>(2M Cache, up to 1.83 GHz)<br>2GB RAM                                  | ? | ? |
| Old Laptop            |                                                                                                        | ? | ? |
| RasPi 3               | Quad Core 1.2GHz Broadcom BCM2837 64bit CPU<br>1GB RAM                                                 | ? | ? |

## Other info

- https://docs.rancherdesktop.io/how-to-guides/create-multi-node-cluster/
- https://www.blasbenito.com/post/01_home_cluster/
- https://www.open-mpi.org/
- https://www.rocksclusters.org/

