#! /bin/bash

set +e

killall dms
dms &

wlr-randr --output DP-1 --mode 3840x2160@60Hz
wlr-randr --output DP-2 --mode 1920x1080@60Hz

