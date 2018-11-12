#!/bin/bash

cmd="nc ${DUMP1090_HOST} ${DUMP1090_PORT} | nc data.adsbhub.org 5001"

while true; do
    check=`netstat -an | grep ".5001 \|:5001 "`

    if [ ${#check} -ge 10 ]
    then
	result="connected"
    else
	result="not connected"
	eval "${cmd}" &
    fi

    #echo $result

    sleep 60
done