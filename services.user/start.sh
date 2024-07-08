#!/bin/sh
fluentd -c /fluentd/etc/fluent.conf &
python service.py