FROM debian
MAINTAINER Paul Bellamy <paul.a.bellamy@gmail.com>

RUN apt-get update \
 && apt-get install -y ca-certificates git wget

RUN wget https://media.urbit.org/dist/debian/urbit_0.4.3-1_amd64.deb \
 && dpkg --force-depends -i urbit_0.4.3-1_amd64.deb \
 && apt-get install -fy

WORKDIR /urbit
EXPOSE 8443
ENTRYPOINT ["urbit"]
