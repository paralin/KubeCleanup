FROM phusion/baseimage:0.9.17

ENV VERSION=1.7.1
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 \
    && echo deb http://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list \
    && sudo apt-get update && sudo apt-get install lxc-docker-$VERSION -y --no-install-recommends \
    && apt-get update

CMD ["/sbin/my_init"]

RUN mkdir /etc/service/cleanup
ADD cleanup.sh /etc/service/cleanup/run
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
VOLUME /var/run/
