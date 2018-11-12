FROM balena/armv7hf-debian:stretch

ENV DUMP1090_HOST="" DUMP1090_PORT=""

RUN [ "cross-build-start" ]

WORKDIR /tmp

RUN \
 apt-get update -qy \
 && apt-get install -qy \
    net-tools \
    netcat \
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
