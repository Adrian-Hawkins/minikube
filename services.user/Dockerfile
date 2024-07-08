# It would probably be better to create a base image with fluentd installed
# and then use that as the base image for this service. This would
# make it easier to maintain the fluentd configuration.
FROM python:3.10-alpine
WORKDIR /app
RUN apk add --no-cache ruby ruby-dev build-base \
    && gem install fluentd fluent-plugin-grafana-loki
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
COPY fluent.conf /fluentd/etc/
RUN mkdir -p /app/logs
EXPOSE 8888
RUN chmod +x start.sh
CMD ["./start.sh"]