FROM debian:jessie

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list
RUN apt-get update
RUN apt-get install -y libgmp3-dev libsigsegv-dev openssl libssl-dev libncurses5-dev git make exuberant-ctags automake autoconf libtool g++ ragel cmake re2c libuv1 curl
RUN git clone --recursive --depth 1 https://github.com/urbit/urbit.git /usr/local/urbit
RUN make -C /usr/local/urbit
RUN ln -s -T /usr/local/urbit/bin/urbit /usr/local/bin/urbit

RUN mkdir /urbit
WORKDIR /urbit
RUN curl -o urbit.pill https://bootstrap.urbit.org/latest.pill

ENTRYPOINT ["urbit"]
