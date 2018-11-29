#!/bin/sh

set -o errexit          # Exit on most errors (see the manual)
#set -o errtrace         # Make sure any error trap is inherited
set -o nounset          # Disallow expansion of unset variables
#set -o pipefail         # Use last non-zero exit code in a pipeline
set -o xtrace          # Trace the execution of the script (debug)


echo "Waiting for dump1090 to start up"
sleep 5s

echo
echo "FLIGHTAWARE_FEEDER_ID=${PIAWARE_FEEDER_ID}"
echo

if [ -z "${PIAWARE_FEEDER_ID}" ]; then
	echo "No PIAWARE_FEEDER_ID set"
else
	/usr/bin/piaware-config "feeder-id" "${PIAWARE_FEEDER_ID}"
fi

# Fix issue with fa-mlat-client
# The fa-mlat-client is run as "nobody" with most permissions dropped.
# This causes issues with extracting to ~/.shiv (the default) so use /tmp instead.
export SHIV_ROOT='/tmp'

piaware -plainlog

exit ${?}
