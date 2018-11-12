FROM resin/armv7hf-debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ENV DUMP1090_HOST="" DUMP1090_PORT="" OPENSKY_USER="" DUMP1090_LAT="" DUMP1090_LON="" DUMP1090_ALT="" SERIAL="" 

RUN [ "cross-build-start" ]

WORKDIR /tmp

RUN \
 apt-get update -qy \
 && apt-get install -qy \
 	wget \
 	perl \
 	init-system-helpers \
 && wget https://opensky-network.org/files/firmware/opensky-feeder_latest_armhf.deb \
 && echo 'opensky-feeder openskyd/latitude string 2' >> /tmp/preseed.txt; \
 echo 'opensky-feeder openskyd/longitude string 2' >> /tmp/preseed.txt; \
 echo 'opensky-feeder openskyd/altitude string 1' >> /tmp/preseed.txt; \
 echo 'opensky-feeder openskyd/username string' >> /tmp/preseed.txt; \
 echo 'opensky-feeder openskyd/serial string' >> /tmp/preseed.txt; \
 echo 'opensky-feeder openskyd/port string' >> /tmp/preseed.txt; \
 echo 'opensky-feeder openskyd/host string' >> /tmp/preseed.txt; \
 debconf-set-selections /tmp/preseed.txt \
 && dpkg -i /tmp/opensky*.deb \
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
