#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)
if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
  MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar main &
else
  primary=$(xrandr --query | grep primary | cut -d" " -f1)
  for m in $screens; do
      echo $screens
      if [[ $primary == $m ]]; then
          MONITOR=$m TRAY_POS=right polybar primary &
      else
          MONITOR=$m TRAY_POS=none polybar primary &
      fi
  done
fi

echo "Bar launched..."
