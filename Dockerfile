FROM alpine:3.8

LABEL maintainer="denis@localistico.com"

RUN apk update && \
    apk add squid curl && \
    echo "username:$(echo password | mkpasswd -m sha512)" > /etc/squid/htpasswd && \
    rm -rf /var/cache/apk/*

ADD ./etc-squid /etc/squid/
ADD ./entrypoint.sh /sbin/entrypoint.sh
ENTRYPOINT ["/sbin/entrypoint.sh"]
