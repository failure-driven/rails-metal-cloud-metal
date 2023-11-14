# Traefik edge router

Kamal seems to use traefik app proxy so why not try it out

## Info

- https://traefik.io/
- https://traefik.io/traefik/
- https://doc.traefik.io/traefik/getting-started/quick-start/

```sh
make
make setup
make demo
make clean
```

to manually fire up traefik? did not seem to work

```sh
docker run -d \
    -p 8080:8080 
    -p 80:80 
    -v $PWD/traefik.toml:/etc/traefik/traefik.toml \
    traefik
```

