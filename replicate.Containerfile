FROM alpine:latest

RUN apk add envsubst

RUN wget https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp rclone-*-linux-amd64/rclone /usr/bin/ && \
    chmod +x /usr/bin/rclone && \
    rm -rf rclone-*-linux-amd64 rclone-current-linux-amd64.zip

COPY crontab.cron /var/spool/cron/crontabs/root
COPY rclone.conf /tmp/rclone.conf
COPY replicate.entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
