#!/usr/bin/env bash

set -e
set -u
set -o pipefail

###
### Globals
###

# Set via Dockerfile
# MY_USER
# MY_GROUP

# Path to scripts to source
CONFIG_DIR="/docker-entrypoint.d"

###
### Source libs
###
init="$( find "${CONFIG_DIR}" -name '*.sh' -type f | sort -u )"
for f in ${init}; do
    # shellcheck disable=SC1090
    . "${f}"
done



#############################################################
## Basic Settings
#############################################################

###
### Set Debug level
###
DEBUG_LEVEL="$( env_get "DEBUG_ENTRYPOINT" "0" )"
log "info" "Debug level: ${DEBUG_LEVEL}" "${DEBUG_LEVEL}"

###
### Change uid/gid
###
set_uid "NEW_UID" "${MY_USER}"  "${DEBUG_LEVEL}"
set_gid "NEW_GID" "${MY_GROUP}" "${DEBUG_LEVEL}"


###
### Set timezone
###
set_timezone "TIMEZONE" "${DEBUG_LEVEL}"

exec tail -f /dev/stdout