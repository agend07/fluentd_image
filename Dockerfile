FROM ubuntu:12.04

RUN apt-get update && apt-get install -y -q curl libcurl3 sudo ruby-dev
RUN curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-precise.sh | sh

ENV LD_PRELOAD /usr/lib/fluent/jemalloc/lib/libjemalloc.so
RUN ulimit -n 65536

EXPOSE 24224

ENTRYPOINT ["/usr/sbin/td-agent"]
CMD ["-v"]
