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

ENV DUMP1090_PORT="" DUMP1090_LAT="" DUMP1090_LON=""

COPY --from=builder /tmp/*.deb /tmp/

RUN [ "cross-build-start" ]

WORKDIR /tmp

RUN \
 dpkg -i piaware*.deb \
 && apt-get update -qy \
 && apt-get -f install -qy \
    dump1090-fa \
    lighttpd \
 && apt-get clean \
 && echo 'blacklist dvb_usb_rtl28xxu' > /etc/modprobe.d/rtlsdr-blacklist.conf \
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
