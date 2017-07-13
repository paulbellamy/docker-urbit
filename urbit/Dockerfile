FROM debian:jessie
MAINTAINER Paul Bellamy <paul.a.bellamy@gmail.com>

RUN apt-get update \
 && apt-get install -y ca-certificates git wget libgmp3-dev libsigsegv-dev \
      libcurl4-gnutls-dev libssl1.0.0

RUN wget https://media.urbit.org/dist/debian/urbit_0.4.5-1_amd64.deb \
 && dpkg --force-depends -i urbit_0.4.5-1_amd64.deb \
 && apt-get install -fy

WORKDIR /urbit
EXPOSE 8443
ENTRYPOINT ["urbit"]
