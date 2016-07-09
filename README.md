# docker-urbit

Dockerfile for Urbit. Built image is [paulbellamy/urbit](https://hub.docker.com/r/paulbellamy/urbit/)

## Usage

```
$ docker run -ti -v `pwd`:/urbit paulbellamy/urbit -h
```

Workdir is `/urbit`, and all data is stored there, so you'll want to
mount that from the local filesystem. If you're booting an existing
ship, you'll want to mount it's data into `/urbit/<ship-name>`.
