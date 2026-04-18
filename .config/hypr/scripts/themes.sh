#!/bin/bash
TEMA=$(find $HOME/.config/hypr/themes/ -name "*.conf" ! -name "current.conf" -exec basename {} .conf \; | rofi -dmenu -p "Tema:")

[ -z "$TEMA" ] && exit

# 2. La magia: Actualizamos los punteros (symlinks)
ln -sf $HOME/.config/hypr/themes/$TEMA.conf    $HOME/.config/hypr/themes/current.conf
ln -sf $HOME/.config/waybar/themes/$TEMA.css   $HOME/.config/waybar/themes/current.css
ln -sf $HOME/.config/fish/conf.d/themes/$TEMA.fish  $HOME/.config/fish/conf.d/themes/current.fish
ln -sf $HOME/.config/rofi/themes/$TEMA.rasi  $HOME/.config/rofi/themes/current.rasi

# 3. Avisar a las apps que despierten
hyprctl reload
# Recarga inteligente de Waybar
if pgrep -x "waybar" > /dev/null; then
    killall -SIGUSR2 waybar
    # Le damos un instante para ver si sobrevive a la recarga
    sleep 0.1
    # Si después de la señal ya no está el proceso, es que el CSS falló y se cerró
    if ! pgrep -x "waybar" > /dev/null; then
        waybar &
    fi
else
    waybar &
fi
# Para Kitty:
killall -SIGUSR1 kitty 
# Fish se actualizará en la próxima terminal que abras.