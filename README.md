# DEPRECEATED
* I have moved to a multi-arch version of this that doesn't use docker-compose.
## The Following are the new maintained images
* https://hub.docker.com/r/shoginn/dump1090/
* https://hub.docker.com/r/shoginn/adsbexchange-mlat/
* https://hub.docker.com/r/shoginn/adsbhub/
* https://hub.docker.com/r/shoginn/flightaware/
* https://hub.docker.com/r/shoginn/flightradar24/
* https://hub.docker.com/r/shoginn/openskynetwork/
* https://hub.docker.com/r/shoginn/planefinder/


# Docker ADS-B
Docker containers for ADS-B receiving and submission to multiple websites

Currently supporting inputs from any dump1090 compatible device including:
* Any RTLSDR USB device
* Any network AVR or BEAST device
* Any serial AVR or BEAST device

supporting outputs to the following sites:
* https://adsbexchange.com
* http://www.adsbhub.org
* https://flightaware.com
* https://wwww.flightradar24.com
* https://opensky-network.org
* https://planefinder.net

and local viewing via:
* planefinder web UI

# Requirements

This setup currently is for docker on your raspberry pi running raspbian.

It requires a manual raspbian/docker-compose setup (not the normal apt package) due to the version of yaml im using.


# Status
| Branch | Status |
|--------|--------|
| latest | [![Build Status](https://travis-ci.org/ShoGinn/docker-ads-b.svg?branch=latest)](https://travis-ci.org/ShoGinn/docker-ads-b) |

| dump1090 | adsbexchange-mlat | adsbhub | flightaware | flightradar24 | openskynetwork | planefinder |
|----------|-------------------|---------|-------------|---------------|----------------|-------------|
| [![](https://images.microbadger.com/badges/image/shoginn/docker-ads-b-dump1090.svg)](https://microbadger.com/images/shoginn/docker-ads-b-dump1090)   | [![](https://images.microbadger.com/badges/image/shoginn/docker-ads-b-adsbexchange-mlat.svg)](https://microbadger.com/images/shoginn/docker-ads-b-adsbexchange-mlat)   | [![](https://images.microbadger.com/badges/image/shoginn/docker-ads-b-adsbhub.svg)](https://microbadger.com/images/shoginn/docker-ads-b-adsbhub)   | [![](https://images.microbadger.com/badges/image/shoginn/docker-ads-b-flightaware.svg)](https://microbadger.com/images/shoginn/docker-ads-b-flightaware)   | [![](https://images.microbadger.com/badges/image/shoginn/docker-ads-b-flightradar24.svg)](https://microbadger.com/images/shoginn/docker-ads-b-flightradar24)   | [![](https://images.microbadger.com/badges/image/shoginn/docker-ads-b-openskynetwork.svg)](https://microbadger.com/images/shoginn/docker-ads-b-openskynetwork)   | [![](https://images.microbadger.com/badges/image/shoginn/docker-ads-b-planefinder.svg)](https://microbadger.com/images/shoginn/docker-ads-b-planefinder)   |
| [![](https://images.microbadger.com/badges/version/shoginn/docker-ads-b-dump1090.svg)](https://microbadger.com/images/shoginn/docker-ads-b-dump1090) | [![](https://images.microbadger.com/badges/version/shoginn/docker-ads-b-adsbexchange-mlat.svg)](https://microbadger.com/images/shoginn/docker-ads-b-adsbexchange-mlat) | [![](https://images.microbadger.com/badges/version/shoginn/docker-ads-b-adsbhub.svg)](https://microbadger.com/images/shoginn/docker-ads-b-adsbhub) | [![](https://images.microbadger.com/badges/version/shoginn/docker-ads-b-flightaware.svg)](https://microbadger.com/images/shoginn/docker-ads-b-flightaware) | [![](https://images.microbadger.com/badges/version/shoginn/docker-ads-b-flightradar24.svg)](https://microbadger.com/images/shoginn/docker-ads-b-flightradar24) | [![](https://images.microbadger.com/badges/version/shoginn/docker-ads-b-openskynetwork.svg)](https://microbadger.com/images/shoginn/docker-ads-b-openskynetwork) | [![](https://images.microbadger.com/badges/version/shoginn/docker-ads-b-planefinder.svg)](https://microbadger.com/images/shoginn/docker-ads-b-planefinder) |
| [![](https://images.microbadger.com/badges/commit/shoginn/docker-ads-b-dump1090.svg)](https://microbadger.com/images/shoginn/docker-ads-b-dump1090)  | [![](https://images.microbadger.com/badges/commit/shoginn/docker-ads-b-adsbexchange-mlat.svg)](https://microbadger.com/images/shoginn/docker-ads-b-adsbexchange-mlat)  | [![](https://images.microbadger.com/badges/commit/shoginn/docker-ads-b-adsbhub.svg)](https://microbadger.com/images/shoginn/docker-ads-b-adsbhub)  | [![](https://images.microbadger.com/badges/commit/shoginn/docker-ads-b-flightaware.svg)](https://microbadger.com/images/shoginn/docker-ads-b-flightaware)  | [![](https://images.microbadger.com/badges/commit/shoginn/docker-ads-b-flightradar24.svg)](https://microbadger.com/images/shoginn/docker-ads-b-flightradar24)  | [![](https://images.microbadger.com/badges/commit/shoginn/docker-ads-b-openskynetwork.svg)](https://microbadger.com/images/shoginn/docker-ads-b-openskynetwork)  | [![](https://images.microbadger.com/badges/commit/shoginn/docker-ads-b-planefinder.svg)](https://microbadger.com/images/shoginn/docker-ads-b-planefinder)  |
| [![Docker Pulls](https://img.shields.io/docker/pulls/shoginn/docker-ads-b-dump1090.svg)](https://hub.docker.com/r/shoginn/docker-ads-b-dump1090/)    | [![Docker Pulls](https://img.shields.io/docker/pulls/shoginn/docker-ads-b-adsbexchange-mlat.svg)](https://hub.docker.com/r/shoginn/docker-ads-b-adsbexchange-mlat/)    | [![Docker Pulls](https://img.shields.io/docker/pulls/shoginn/docker-ads-b-adsbhub.svg)](https://hub.docker.com/r/shoginn/docker-ads-b-adsbhub/)    | [![Docker Pulls](https://img.shields.io/docker/pulls/shoginn/docker-ads-b-flightaware.svg)](https://hub.docker.com/r/shoginn/docker-ads-b-flightaware/)    | [![Docker Pulls](https://img.shields.io/docker/pulls/shoginn/docker-ads-b-flightradar24.svg)](https://hub.docker.com/r/shoginn/docker-ads-b-flightradar24/)    | [![Docker Pulls](https://img.shields.io/docker/pulls/shoginn/docker-ads-b-openskynetwork.svg)](https://hub.docker.com/r/shoginn/docker-ads-b-openskynetwork/)    | [![Docker Pulls](https://img.shields.io/docker/pulls/shoginn/docker-ads-b-planefinder.svg)](https://hub.docker.com/r/shoginn/docker-ads-b-planefinder/)    |

# How to use
## Edit variables
Edit the 'variables' files with the required keys and locations for each of the services

### variables-common.env
*These are not optional and must be set*
* ADSB_LATITUDE ; The latitude of your ADSB Antenna ( In decimal format ex. 36.000)
* ADSB_LONGITUDE ; The longitude of your ADSB Antenna (In decimal format ex. -115.000)
* ADSB_ALTITUDE ; The altitude above sea level for your ADSB Antenna (In decimal format ex. 500.00)

### variables-adsbexchange-mlat.env
* MLAT_CLIENT_USER

## variables-flightware.env
Go to https://flightaware.com/adsb/piaware/claim
* FLIGHTAWARE_FEEDER_ID

### variables-flightradar24.env
* FR24FEED_KEY: Your key. If you do not have one please run the client on any PC and enter the key here

### variables-openskynetwork.env
* OPENSKY_USER=
* OPENSKY_SERIAL=

### variables-planefinder.env
* PLANEFINDER_SHARECODE

## Docker Hub Links
* https://hub.docker.com/r/shoginn/docker-ads-b-dump1090/
* https://hub.docker.com/r/shoginn/docker-ads-b-adsbexchange-mlat/
* https://hub.docker.com/r/shoginn/docker-ads-b-adsbhub/
* https://hub.docker.com/r/shoginn/docker-ads-b-flightaware/
* https://hub.docker.com/r/shoginn/docker-ads-b-flightradar24/
* https://hub.docker.com/r/shoginn/docker-ads-b-openskynetwork/
* https://hub.docker.com/r/shoginn/docker-ads-b-planefinder/
