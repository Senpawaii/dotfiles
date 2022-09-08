#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

MONITOR=$(polybar -m|tail -2|head -n 1|sed -e 's/:.*$//g') polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
# MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g') polybar secondary 2>&1 | tee -a /tmp/polybar2.log & disown




#screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

#if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
#  MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar main &
#else
#  primary=DP-1-0

#  for m in $screens; do
#    if [[ $primary == $m ]]; then
#        MONITOR=$m TRAY_POS=right polybar main &
#    else
#        MONITOR=$m TRAY_POS=none polybar secondary &
#    fi
#  done
#fi
