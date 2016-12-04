FROM debian
MAINTAINER Paul Bellamy <paul.a.bellamy@gmail.com>

RUN apt-get update
RUN apt-get install -y \
      ca-certificates \
      git \
      wget
RUN wget https://media.urbit.org/dist/debian/urbit_0.4-1_amd64.deb
RUN dpkg -i urbit_0.4-1_amd64.deb ; apt-get install -y -f

ADD create_or_run /usr/local/bin/create_or_run

RUN mkdir /urbit
RUN git clone --recursive --depth 1 https://github.com/urbit/arvo /urbit/arvo
WORKDIR /urbit

ENTRYPOINT ["urbit"]
