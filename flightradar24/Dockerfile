FROM balenalib/armv7hf-debian:stretch as builder

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN \
 apt-get update -qy \
 && apt-get install -qy \
    wget \
 && wget -qO - `wget -qO - https://repo-feed.flightradar24.com/fr24feed_versions.json | grep -Eo 'http://.*?/rpi_binaries/fr24feed_.*?_armhf.tgz'` | tar xzf -

FROM balenalib/armv7hf-debian:stretch

ENV DEBIAN_FRONTEND noninteractive

ENV DUMP1090_HOST="" DUMP1090_PORT="" FR24_KEY=""

WORKDIR /

COPY --from=builder /tmp/fr24feed_armhf/fr24feed /usr/bin/fr24feed

EXPOSE 8754

WORKDIR /root

COPY ./start.sh start.sh		
RUN chmod +x start.sh

ENTRYPOINT ["/root/start.sh"]
