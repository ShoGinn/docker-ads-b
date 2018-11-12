#!/bin/bash
mkdir /run/dump1090-mutability

/usr/sbin/service lighttpd start

/usr/bin/dump1090-mutability \
--quiet \
--net \
--net-sbs-port $DUMP1090_SBS_PORT \
--lat $DUMP1090_LAT \
--lon $DUMP1090_LON \
--write-json /run/dump1090-mutability \
--write-json-every 1 \
--json-location-accuracy 2 &

while true
        do
        sleep 20
done
