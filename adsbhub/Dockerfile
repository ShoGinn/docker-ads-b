FROM multiarch/alpine:armhf-v3.8

ENV DUMP1090_HOST="" DUMP1090_PORT=""

RUN apk add --no-cache socat iputils

COPY adsbhub-client.sh /usr/local/bin/adsbhub-client
ENTRYPOINT ["adsbhub-client"]
