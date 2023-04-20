#!/bin/sh
set -e

echo "Container's IP address: `awk 'END{print $1}' /etc/hosts`"

fluentd --config /fluentd/etc/fluent.conf