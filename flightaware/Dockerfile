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

ENV DUMP1090_HOST="" DUMP1090_PORT="" PIAWARE_FEEDER_ID=""

COPY --from=builder /tmp/*.deb /tmp/

RUN [ "cross-build-start" ]

WORKDIR /tmp

RUN \
 dpkg -i piaware*.deb \
 && apt-get update -qy \
 && apt-get -f install -qy \
    piaware \
    gpsd \
 && apt-get -f install \
 && piaware-config allow-auto-updates no \
 && piaware-config allow-manual-updates no \
 && piaware-config receiver-type other \
 && piaware-config mlat-results no \
 && apt-get clean \
 && rm -rf \
      /tmp/* \
	  /var/lib/apt/lists/* \
	  /var/tmp/*

RUN [ "cross-build-end" ] 

WORKDIR /root

COPY ./start.sh start.sh
RUN chmod +x start.sh

ENTRYPOINT ["/root/start.sh"]
