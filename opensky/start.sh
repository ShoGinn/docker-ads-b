#!/bin/bash

[[ ! -z ${DUMP1090_LAT} ]]       		&& debconf-set-selections <<< "opensky-feeder openskyd/latitude string ${DUMP1090_LAT}" || DUMP1090_LAT="1"
[[ ! -z ${DUMP1090_LON} ]]       		&& debconf-set-selections <<< "opensky-feeder openskyd/longitude string ${DUMP1090_LON}" || DUMP1090_LON="1"
[[ ! -z ${DUMP1090_ALT} ]]       		&& debconf-set-selections <<< "opensky-feeder openskyd/altitude string ${DUMP1090_ALT}" || DUMP1090_ALT="1"
[[ ! -z ${OPENSKY_USER} ]]       		&& debconf-set-selections <<< "opensky-feeder openskyd/username string ${OPENSKY_USER}" || OPENSKY_USER=""
[[ ! -z ${SERIAL} ]]       		&& debconf-set-selections <<< "opensky-feeder openskyd/serial string ${SERIAL}" || SERIAL=""
[[ ! -z ${DUMP1090_HOST} ]]             &&  debconf-set-selections <<< "opensky-feeder openskyd/host string ${DUMP1090_HOST}" || DUMP1090_HOST="dump1090"
[[ ! -z ${DUMP1090_PORT} ]]             &&  debconf-set-selections <<< "opensky-feeder openskyd/port string ${DUMP1090_PORT}" || DUMP1090_PORT="30005"
dpkg-reconfigure opensky-feeder

/usr/bin/openskyd-dump1090
