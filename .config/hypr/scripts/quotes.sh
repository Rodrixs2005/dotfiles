#!/bin/sh

FILE="$HOME/.config/hypr/scripts/quotes.txt"
TMP="$HOME/.config/hypr/scripts/quotes.tmp"

if [ ! -s "$TMP" ]; then
    shuf "$FILE" > "$TMP"
fi

frase="$(head -n 1 "$TMP")"

echo "$frase"

sed -i '1d' "$TMP"
