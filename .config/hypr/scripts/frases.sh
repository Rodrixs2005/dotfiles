#!/bin/sh

FILE="$HOME/.config/hypr/scripts/frases.txt"
TMP="$HOME/.config/hypr/scripts/frases.tmp"

if [ ! -s "$TMP" ]; then
    shuf "$FILE" > "$TMP"
fi

frase="$(head -n 1 "$TMP")"

echo "$frase"

sed -i '1d' "$TMP"
