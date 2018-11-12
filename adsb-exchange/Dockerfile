FROM balenalib/armv7hf-debian:stretch as builder

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN [ "cross-build-start" ]

RUN \
    apt-get update -qy \
    && apt-get install --no-install-recommends -qy \
       git \
       build-essential \
       python-dev \
       python3-dev \
       debhelper \
    && git clone https://github.com/mutability/mlat-client.git \
    && cd mlat-client \
    && dpkg-buildpackage -b -uc

RUN [ "cross-build-end" ] 

FROM balenalib/armv7hf-debian:stretch

COPY --from=builder /tmp/*.deb /tmp/

ENV DEBIAN_FRONTEND noninteractive

ENV DUMP1090_HOST="" DUMP1090_LAT="" DUMP1090_LON="" DUMP1090_ALT="" ADSB_EX_USER=""

RUN [ "cross-build-start" ]

WORKDIR /tmp

RUN \
    apt-get update -qy \
    && apt-get install --no-install-recommends -qy \
      python3 \
    && dpkg -i mlat-client*.deb \
    && rm -rf \
       /tmp/* \
       /var/lib/apt/lists/* \
       /var/tmp/*

RUN [ "cross-build-end" ] 

WORKDIR /root

COPY ./start.sh start.sh
RUN chmod +x start.sh

ENTRYPOINT ["/root/start.sh"]
