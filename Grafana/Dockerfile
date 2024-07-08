FROM grafana/grafana:latest
COPY datasources /etc/grafana/provisioning/datasources
COPY dashboards /etc/grafana/provisioning/dashboards
EXPOSE 3000
CMD ["grafana-server", "--homepath=/usr/share/grafana"]