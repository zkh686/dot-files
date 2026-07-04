# ~/.config/scripts/wallpaper-watcher.sh

# Reset to default on reboot
cp $DEFAULT_WALLPAPER $CURRENT_WALLPAPER
echo $DEFAULT_WALLPAPER >$CURRENT_WALLPAPER_PATH

# Watch for changes
while inotifywait -e close_write "$CURRENT_WALLPAPER_PATH" >/dev/null 2>&1; do
  # Get the path to the new wallpaper
  FPATH=$(cat $CURRENT_WALLPAPER_PATH)

  # Copy the new wallpaper file
  cp $FPATH $CURRENT_WALLPAPER

  # Push the update to your wallpaper engine
  FOCUSED_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
  hyprctl hyprpaper reload "$FOCUSED_MONITOR","$FPATH"
done