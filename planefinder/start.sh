#!/bin/bash

/usr/bin/pfclient --address=$DUMP1090_HOST --port=$DUMP1090_PORT --sharecode=$PF_SHARECODE --lat=$DUMP1090_LAT --lon=$DUMP1090_LON --data_format=1
