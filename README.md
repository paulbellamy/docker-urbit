# docker-urbit

![](https://images.microbadger.com/badges/image/paulbellamy/urbit.svg)

Dockerfile for Urbit. Built image is [paulbellamy/urbit][dockerhub].

## Usage

```
$ docker run -ti paulbellamy/urbit -c mycomet
```

### Keeping Your Data

Workdir is `/urbit`, and all data is stored there, so if you want to
keep your data, you'll want to mount your urbit from the local
filesystem. For example, to create a comet, and store the data
locally:

```
$ docker run -ti -v `pwd`:/urbit paulbellamy/urbit -c mycomet
```

If you're booting an existing urbit, you'll want to mount it's data
into `/urbit/<name>`. For example, to launch an existing urbit, named
`fintud-macrep`:

```
$ docker run -ti -v `pwd`/fintud-macrep:/urbit/fintud-macrep paulbellamy/urbit fintud-macrep
```

### Starting with a fake `~zod`

This can be useful for development

```
$ docker run -ti paulbellamy/urbit -F -I zod -A /arvo -c mycomet
```

There is another image, with a different entrypoint and the arvo repo checked
out to make this even easier:

    $ docker run -ti paulbellamy/fakeurbit -A /arvo -c piername

to start it up after stopping it, omit `-A` and `-c`:

    $ docker run -ti paulbellamy/fakeurbit piername

### More Info

For more info on usage, please see [the urbit setup docs][urbit-setup].

[dockerhub]:    https://hub.docker.com/r/paulbellamy/urbit/
[urbit-setup]:  http://urbit.org/docs/using/setup/
