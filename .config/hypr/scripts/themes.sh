#!/bin/bash
TEMA=$(find ~/dotfiles/.config/hypr/themes/ -name "*.conf" ! -name "current.conf" -exec basename {} .conf \; | rofi -dmenu -p "Tema:")

[ -z "$TEMA" ] && exit

# 2. La magia: Actualizamos los punteros (symlinks)
ln -sf ~/dotfiles/.config/hypr/themes/$TEMA.conf    ~/dotfiles/.config/hypr/themes/current.conf
ln -sf ~/dotfiles/.config/waybar/themes/$TEMA.css   ~/dotfiles/.config/waybar/themes/current.css
ln -sf ~/dotfiles/.config/fish/conf.d/themes/$TEMA.fish  ~/dotfiles/.config/fish/conf.d/themes/current.fish
ln -sf ~/dotfiles/.config/rofi/themes/$TEMA.rasi  ~/dotfiles/.config/rofi/themes/current.rasi

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