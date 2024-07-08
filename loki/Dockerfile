FROM grafana/loki:2.8.0
COPY loki-config.yml /etc/loki/loki-config.yml
EXPOSE 3100
CMD ["-config.file=/etc/loki/loki-config.yml", "-config.expand-env=true"]