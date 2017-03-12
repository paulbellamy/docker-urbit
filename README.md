# docker-urbit
![](https://images.microbadger.com/badges/image/paulbellamy/urbit.svg)

Dockerfile for Urbit. Built image is [paulbellamy/urbit][dockerhub].

## Usage
To start a new urbit with a pier called `mycomet`:

    $ docker run -ti paulbellamy/urbit -c mycomet

Don't forget `-t` and `-i` or urbit will shut down immediately due to the
lack of an attached TTY.

### HTTP access
The image exposes the urbit's http server at port 8443. Publishing that port
Will allow you to see your urbit's hosted content at `localhost:8080`:

    $ docker run -ti -p 8080:8443 pauleballmy/urbit -c mycomet

Port 8443 requires authenticateion, which makes sense since the docker image
may be running on a server. To publish the local pre-authenticated port (8080),
and only make it accessible locally, you can start your container like this:

    $ docker run -ti -p 127.0.0.1:8080:8080 pauleballmy/urbit -c mycomet

### Binding data to the host FS
The container's working directory is `/urbit`, and all data is stored there,
so if you want to keep your data, you'll want to mount your urbit from the
local filesystem. For example, to create a comet in a directory `mycomet`:

    $ docker run --rm \
        --volume `pwd`:/urbit \
        -ti paulbellamy/urbit \
        -c mycomet

You will most certainly want to access this data with a non-root account, but
urbit is running as root inside this container (for a few good reasons).
To ensure that you can access the files and directories created by urbit,
run the container with the `--user` option set to your user and group id:

    $ docker run --rm \
        --volume `pwd`:/urbit \
        --user `id -u`:`id -g` \
        -ti paulbellamy/urbit \
        -c mycomet

Currently you need to mount the whole `/urbit` when creating a new urbit,
because if you mount to `/urbit/mycomet`, docker will initialize that directory
and `vere` wont start if it exists (even though it will be empty).

If you're booting an existing urbit however, you'll want to mount only the pier
into `/urbit/<name>`. For example, to launch an existing urbit `fintud-macrep`:

    $ docker run \
        --volume `pwd`/fintud-macrep:/urbit/fintud-macrep \
        -ti paulbellamy/urbit \
        -c mycomet

Note the `--rm` in the `-c` examples above, most likely you will want to run a
container with `-c` once, then start another, permanent one to keep it running.

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

## Troubleshooting
If your container keeps printing something like

    unix: stopping process 1, live in fzod...

and restarting, you are stuck in a restart loop. Your urbit thinks another
process is running, and by trying to kill it terminates itself.

The fix is rather simple. First, make sure your container is stopped:

    $ docker kill fakezod

then simply delete the vere lockfile:

    $ rm /path/to/pier/.vere.lock

if you dont have the volume mounted, `docker exec` in the running container:

    $ docker exec fakezod rm /urbit/fzod/.vere.lock

## More Info
For more info on usage, please see [the urbit setup docs][urbit-setup].

[dockerhub]:    https://hub.docker.com/r/paulbellamy/urbit/
[urbit-setup]:  http://urbit.org/docs/using/setup/
[arvo]:         https://github.com/urbit/arvo/
