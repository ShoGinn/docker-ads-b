#!/bin/bash

[[ ! -z ${ADSB_LATITUDE} ]]       		&& debconf-set-selections <<< "opensky-feeder openskyd/latitude string ${ADSB_LATITUDE}" || ADSB_LATITUDE="1"
[[ ! -z ${ADSB_LONGITUDE} ]]       		&& debconf-set-selections <<< "opensky-feeder openskyd/longitude string ${ADSB_LONGITUDE}" || ADSB_LONGITUDE="1"
[[ ! -z ${ADSB_ALTITUDE} ]]       		&& debconf-set-selections <<< "opensky-feeder openskyd/altitude string ${ADSB_ALTITUDE}" || ADSB_ALTITUDE=="1"
[[ ! -z ${OPENSKY_USER} ]]       		&& debconf-set-selections <<< "opensky-feeder openskyd/username string ${OPENSKY_USER}" || OPENSKY_USER=""
[[ ! -z ${OPENSKY_SERIAL} ]]       		&& debconf-set-selections <<< "opensky-feeder openskyd/serial string ${OPENSKY_SERIAL}" || OPENSKY_SERIAL=""
[[ ! -z ${DUMP1090_SERVER} ]]             &&  debconf-set-selections <<< "opensky-feeder openskyd/host string ${DUMP1090_SERVER}" || DUMP1090_SERVER="dump1090"
[[ ! -z ${DUMP1090_PORT} ]]             &&  debconf-set-selections <<< "opensky-feeder openskyd/port string ${DUMP1090_PORT}" || DUMP1090_PORT="30005"
dpkg-reconfigure opensky-feeder

/usr/bin/openskyd-dump1090

exit ${?}