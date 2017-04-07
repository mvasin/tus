# Ruby tus.io server in Docker container

## How to use
Run manually: `docker run -p <put-your-port-here>:9292 vasin/tus`
Or run from `docker-compose.yml`:

```
version: '3'
services:

  tus:
    image: vasin/tus
    ports:
      - "<put-your-port-here>:9292"
```

Now you can [direct](https://github.com/janko-m/shrine-tus-demo/blob/master/assets/js/app.js#L13) your [tus-js-client](https://github.com/tus/tus-js-client) to your host machine on `/tus:<put-your-port-here>`.

## Docker image
Docker hub url: https://hub.docker.com/r/vasin/tus/
