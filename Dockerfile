FROM ubuntu:14.04

RUN apt-get update && apt-get install -y -q curl libcurl4-openssl-dev sudo ruby-dev
RUN curl -L https://td-toolbelt.herokuapp.com/sh/install-ubuntu-trusty-td-agent2.sh | sh

ENV LD_PRELOAD /usr/lib/fluent/jemalloc/lib/libjemalloc.so
RUN ulimit -n 65536

EXPOSE 24224

ENTRYPOINT ["/usr/sbin/td-agent"]
