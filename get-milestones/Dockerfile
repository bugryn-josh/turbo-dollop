FROM alpine:3.14

RUN apk add --no-cache \
    bash \
    curl \
    jq

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]