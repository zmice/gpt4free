#!/usr/bin/env bash
set -e

export DBUS_SESSION_BUS_ADDRESS=`dbus-daemon --fork --config-file=/usr/share/dbus-1/session.conf --print-address`

uvicorn interference.app:app --host=0.0.0.0 --port=11337 --proxy-headers