FROM balenalib/armv7hf-alpine

ENV DUMP1090_HOST="" DUMP1090_PORT=""

RUN apk add --no-cache socat iputils

COPY adsbhub-client.sh /usr/local/bin/adsbhub-client
ENTRYPOINT ["adsbhub-client"]
