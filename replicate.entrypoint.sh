#!/bin/sh
set -xe

mkdir -p /root/.config/rclone
envsubst < /tmp/rclone.conf > /root/.config/rclone/rclone.conf

crond -f -d 8
