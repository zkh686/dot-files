#! /bin/bash

set +e

killall dms
dms &

wlr-randr --output DP-1 --mode 3640x2160@60Hz
wlr-randr --output DP-2 --mode 1920x1080@60Hz


# wlr-randr --output DP-1 --pos 1701,-270
# wlr-randr --output DP-1 --mode 1280x1024@75.025002Hz
