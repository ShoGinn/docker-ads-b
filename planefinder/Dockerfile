FROM balenalib/armv7hf-debian:stretch as builder

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN \
 apt-get update -qy \
 && apt-get install -qy \
    wget \
 && wget $(wget -qO- https://planefinder.net/sharing/client | egrep armhf.deb | awk -F\" '{print $2}')


FROM balenalib/armv7hf-debian:stretch

COPY --from=builder /tmp/*.deb /tmp/

ENV DEBIAN_FRONTEND noninteractive

ENV DUMP1090_HOST="" DUMP1090_PORT="" PF_SHARECODE="" DUMP1090_LAT="" DUMP1090_LON=""

RUN [ "cross-build-start" ]

WORKDIR /tmp

RUN \
 dpkg -i pfclient*armhf.deb \
 && apt-get clean \
 && rm -rf \
    /tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

RUN [ "cross-build-end" ] 


EXPOSE 30053

WORKDIR /root

COPY ./start.sh start.sh
RUN chmod +x start.sh

ENTRYPOINT ["/root/start.sh"]
