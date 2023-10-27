# Work Log

## Fri 27 Oct 2023

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

