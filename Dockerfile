FROM ubuntu
MAINTAINER Brandon R. Stoner <monokrome@limpidtech.com>

ADD btsync /usr/local/bin/btsync
RUN chmod +x /usr/local/bin/btsync

ADD btsync.config /usr/local/etc/btsync.config

EXPOSE 8888
EXPOSE 6880

CMD ["btsync"]
