FROM fluent/fluentd:latest
USER ubuntu
WORKDIR /home/ubuntu
ENV PATH /home/ubuntu/ruby/bin:$PATH
RUN gem install fluent-plugin-s3
EXPOSE 24224

CMD fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins --suppress-config-dump
