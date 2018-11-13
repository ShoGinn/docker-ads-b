FROM balenalib/armv7hf-debian:stretch as builder

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN \
 apt-get update -qy \
 && apt-get install -qy \
    wget \
 && wget $(wget -qO- http://flightaware.com/adsb/piaware/install | egrep wget -m 1 | awk '{print $3}' | awk -F\< '{print $1}')


FROM balenalib/armv7hf-debian:stretch

ENV DEBIAN_FRONTEND noninteractive

ENV DUMP1090_LAT="" DUMP1090_LON=""

COPY --from=builder /tmp/*.deb /tmp/

RUN [ "cross-build-start" ]

WORKDIR /tmp

RUN \
 dpkg -i piaware*.deb \
 && apt-get update -qy \
 && apt-get -f install -qy \
 	perl \
    lighttpd \
    dump1090-fa \
 && apt-get clean \
 && rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

RUN [ "cross-build-end" ]

WORKDIR /root

COPY ./start.sh start.sh
RUN chmod +x start.sh

COPY ./src/index.html /var/www/html/

# web overview
EXPOSE 80

# ports for FlightAware etc
EXPOSE 30003
EXPOSE 30005
EXPOSE 30104

CMD ["/bin/bash", "/root/start.sh"]
