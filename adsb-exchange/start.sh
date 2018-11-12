#!/bin/bash

/usr/bin/python3 /usr/bin/mlat-client --input-type dump1090 --input-connect ${DUMP1090_HOST}:30005 --lat ${DUMP1090_LAT} --lon ${DUMP1090_LON} --alt ${DUMP1090_ALT} --user ${ADSB_EX_USER} --server feed.adsbexchange.com:31090 --no-udp --results beast,connect,${DUMP1090_HOST}:30104
