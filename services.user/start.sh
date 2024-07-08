#!/bin/sh
export CONTAINER=true
fluentd -c /fluentd/etc/fluent.conf &
python service.py