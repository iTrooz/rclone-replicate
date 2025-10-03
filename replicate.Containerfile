FROM alpine:latest

RUN apk add rclone envsubst

COPY crontab.cron /var/spool/cron/crontabs/root
COPY rclone.conf /tmp/rclone.conf
COPY replicate.entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
