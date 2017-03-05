# docker-urbit
![](https://images.microbadger.com/badges/image/paulbellamy/urbit.svg)

Dockerfile for Urbit. Built image is [paulbellamy/urbit][dockerhub].

## Usage
To start a new urbit with a pier called `mycomet`:

    $ docker run -ti paulbellamy/urbit -c mycomet

### HTTP access
The image exposes port 8443, if you publish it you will be able to access your
urbit.

This will allow you to see your urbit's hosted content at `localhost:8080`:

    $ docker run -ti -p 8080:8443 pauleballmy/urbit -c mycomet

Port 8443 requires authenticateion, which makes sense since the docker image
may be running on a server. To publish the local pre-authenticated port (8080),
you can start your container like this:

    $ docker run -ti -p 8080:8080 pauleballmy/urbit -c mycomet

### Binding data to the host FS
Workdir is `/urbit`, and all data is stored there, so if you want to keep your
data, you'll want to mount your urbit from the local filesystem. For example,
to create a comet, and store the data locally:

    $ docker run -ti -v `pwd`:/urbit paulbellamy/urbit -c mycomet

Currently you need to mount the whole `/urbit` when creating a new urbit,
because if you mount to `/urbit/mycomet`, docker will initialize that directory
and `vere` wont start if it exists (even though it will be empty).

If you're booting an existing urbit, however, you'll want to mount only the pier
into `/urbit/<name>`. For example, to launch an existing urbit `fintud-macrep`:

    $ docker run -ti -v `pwd`/fintud-macrep:/urbit/fintud-macrep paulbellamy/urbit fintud-macrep

### Starting with a fake `~zod`
This can be useful for development. [urbit/arvo][arvo] needs to be cloned to
bootstrap the new zod.

    $ git clone https://github.com/urbit/arvo.git
    $ docker run -ti -v `pwd`/arvo:/arvo paulbellamy/urbit -F -I zod -A /arvo -c myzod

There is a tag `fakezod` with a different entrypoint and the arvo repo checked
out in `/arvo` to make this even easier:

    $ docker run -ti paulbellamy/urbit:fakezod -A /arvo -c myzod

to run a container from an existing fakezod pier, omit `-A` and `-c`:

    $ docker run -ti -v `pwd`/myzod:/urbit/myzod paulbellamy/urbit:fakezod myzod

## More Info
For more info on usage, please see [the urbit setup docs][urbit-setup].

[dockerhub]:    https://hub.docker.com/r/paulbellamy/urbit/
[urbit-setup]:  http://urbit.org/docs/using/setup/
[arvo]:         https://github.com/urbit/arvo/
