FROM balenalib/armv7hf-debian:stretch as builder

ENV DEBIAN_FRONTEND noninteractive

RUN [ "cross-build-start" ]

RUN \
 apt-get update -qy \
 && apt-get install --no-install-recommends -qy \
    build-essential \
    cmake \
    git \
    git-core \
    libusb-1.0.0-dev \
    librtlsdr-dev \
    debhelper \
    pkg-config \
    wget

WORKDIR /tmp

RUN \
    git clone git://git.osmocom.org/rtl-sdr.git \
    && git clone https://github.com/mutability/dump1090


RUN \
 cd rtl-sdr \
 && dpkg-buildpackage

RUN \
 cd dump1090 \
 && dpkg-buildpackage

RUN [ "cross-build-end" ]

FROM balenalib/armv7hf-debian:stretch

ENV DEBIAN_FRONTEND noninteractive

ENV DUMP1090_LAT="" DUMP1090_LON=""

COPY --from=builder /tmp/*.deb /tmp/

RUN [ "cross-build-start" ]

RUN \
 apt-get update -qy \
 && apt-get install --no-install-recommends -qy \
    perl \
    lighttpd \
    libusb-1.0.0-dev \
 && apt-get clean \
 && dpkg -i /tmp/librtlsdr* \
 && dpkg -i /tmp/dump1090*.deb \
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
