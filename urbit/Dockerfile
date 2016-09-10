FROM debian:stretch
MAINTAINER Paul Bellamy <paul.a.bellamy@gmail.com>

RUN apt-get update
RUN apt-get install -y \
  autoconf \
  automake \
  ca-certificates \
  cmake \
  exuberant-ctags \
  g++ \
  git \
  libcurl4-gnutls-dev \
  libgmp3-dev \
  libncurses5-dev \
  libsigsegv-dev \
  libssl-dev \
  libtool \
  make \
  openssl \
  ragel \
  re2c
RUN git clone --recursive --depth 1 https://github.com/urbit/urbit.git /usr/local/urbit
RUN make -C /usr/local/urbit
RUN ln -s -T /usr/local/urbit/bin/urbit /usr/local/bin/urbit

RUN mkdir /urbit
RUN git clone --recursive --depth 1 https://github.com/urbit/arvo /urbit/arvo
WORKDIR /urbit

ENTRYPOINT ["urbit"]
