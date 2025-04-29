#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202504291235-git
# @@Author           :  CasjaysDev
# @@Contact          :  CasjaysDev <docker-admin@casjaysdev.pro>
# @@License          :  MIT
# @@ReadME           :
# @@Copyright        :  Copyright 2023 CasjaysDev
# @@Created          :  Mon Aug 28 06:48:42 PM EDT 2023
# @@File             :  05-custom.sh
# @@Description      :  script to run custom
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# shellcheck shell=bash
# shellcheck disable=SC2016
# shellcheck disable=SC2031
# shellcheck disable=SC2120
# shellcheck disable=SC2155
# shellcheck disable=SC2199
# shellcheck disable=SC2317
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set bash options
set -o pipefail
[ "$DEBUGGER" = "on" ] && echo "Enabling debugging" && set -x$DEBUGGER_OPTIONS
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set env variables
exitCode=0

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Predefined actions
mkdir -p "/usr/src/ices0"
if cd /usr/src/ices0 && git clone -q https://github.com/FMFREAK040/ices0.git "/usr/src/ices0"; then
  aclocal && autoreconf -fi && autoconf && automake --add-missing
  ./configure --with-python=/usr/bin/python3 && make && make install
fi
[ -d "/usr/local/etc/modules" ] || mkdir -p "/usr/local/etc/modules"
[ -f "Docker/rootfs/config/ices.py" ] && cp -Rfv Docker/rootfs/config/ices.py /usr/local/etc/modules/ices.py
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Main script

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set the exit code
#exitCode=$?
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
exit $exitCode
