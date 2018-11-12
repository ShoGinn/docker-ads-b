#!/bin/bash
mkdir -p /run/dump1090-fa

/usr/sbin/service lighttpd start

/usr/bin/dump1090-fa \
--quiet \
--net \
--net-sbs-port ${DUMP1090_SBS_PORT:30003} \
--lat $DUMP1090_LAT \
--lon $DUMP1090_LON \
--write-json /run/dump1090-fa \
--write-json-every 1 \
--json-location-accuracy 2 &

while true
        do
        sleep 20
done
