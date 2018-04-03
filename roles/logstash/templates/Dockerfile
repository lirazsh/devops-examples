FROM docker.elastic.co/logstash/logstash:{{ elk_vars["elk_version"] }}

RUN logstash-plugin install logstash-input-journald

CMD ["-f", "/usr/share/logstash/pipeline"]
