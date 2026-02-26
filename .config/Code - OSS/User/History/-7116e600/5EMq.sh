#!/bin/sh

# Set cursor theme for niri / Wayland (and Xwayland apps)
 # Must match an installed theme folder under ~/.icons or /usr/share/icons
export XCURSOR_THEME="Bibata-Modern-Classic"
export XCURSOR_SIZE=24
export XCURSOR_PATH="$HOME/.config/niri:$HOME/.icons:$HOME/.local/share/icons:/usr/share/icons"

# Wallpaper
swaybg -i "$HOME/Pictures/wallpapers/rogue.jpg" -m fill &

# Notifications
mako &

# Clipboard history
wl-paste --watch cliphist store &

# Bar
# waybar &
dms run &
conky &
vicinae server &
~/.config/hypr/scripts/wallpaper-restore.sh


 swaync

# # Load GTK settings
~/.config/hypr/scripts/gtk.sh

# Polkit (needed for mounts, permissions)
 /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# #    ___       __           __           __
# #   / _ |__ __/ /____  ___ / /____ _____/ /_
# #  / __ / // / __/ _ \(_-</ __/ _ `/ __/ __/
# # /_/ |_\_,_/\__/\___/___/\__/\_,_/_/  \__/
# #

# # Load Wallpaper
# exec-once = ~/.config/hypr/scripts/wallpaper-restore.sh


