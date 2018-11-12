#!/bin/bash

[[ ! -z ${DUMP1090_HOST} ]]             &&  /usr/bin/piaware-config receiver-host ${DUMP1090_HOST} || DUMP1090_HOST="dump1090"
[[ ! -z ${DUMP1090_PORT} ]]             &&  /usr/bin/piaware-config receiver-port ${DUMP1090_PORT} || DUMP1090_PORT="30005"
[[ ! -z ${PIAWARE_FEEDER_ID} ]]       && /usr/bin/piaware-config feeder-id ${PIAWARE_FEEDER_ID}

[[ ! -z ${GAIN} ]]             && /usr/bin/piaware-config rtlsdr-gain ${GAIN} || GAIN="-10"
[[ ! -z ${PPM} ]]              && /usr/bin/piaware-config rtlsdr-ppm ${PPM} || PPM="1"

if [[ ! -z ${PIAWARE_GPS} ]]; then
    echo "Enabling GPS"
    /usr/sbin/gpsd -n ${PIAWARE_GPS}
fi

/usr/bin/piaware -debug
