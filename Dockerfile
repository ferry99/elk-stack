FROM logstash:7.8.1
COPY . /tmp
USER root
RUN chmod -R +x /tmp
CMD ["logstash","-f","/tmp/config/logstash-docker.conf"]