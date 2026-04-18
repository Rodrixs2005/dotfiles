#!/bin/bash
TEMA=$(find $HOME/.config/hypr/themes/ -name "*.conf" ! -name "current.conf" -exec basename {} .conf \; | rofi -dmenu -p "Tema:")

[ -z "$TEMA" ] && exit

ln -sf $HOME/.config/hypr/themes/$TEMA.conf    $HOME/.config/hypr/themes/current.conf
ln -sf $HOME/.config/waybar/themes/$TEMA.css   $HOME/.config/waybar/themes/current.css
ln -sf $HOME/.config/fish/conf.d/themes/$TEMA.fish  $HOME/.config/fish/conf.d/themes/current.fish
ln -sf $HOME/.config/rofi/themes/$TEMA.rasi  $HOME/.config/rofi/themes/current.rasi

hyprctl reload

if pgrep -x "waybar" > /dev/null; then
    killall -SIGUSR2 waybar

    sleep 0.1

    if ! pgrep -x "waybar" > /dev/null; then
        waybar &
    fi
else
    waybar &
fi

killall -SIGUSR1 kitty 