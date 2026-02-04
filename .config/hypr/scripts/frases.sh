#!/bin/sh

FILE="/home/rodrigo/.config/hypr/scripts/frases.txt"
TMP="/home/rodrigo/.config/hypr/scripts/frases.tmp"

# Si no existe el archivo temporal o está vacío, lo recreamos barajado
if [ ! -s "$TMP" ]; then
    shuf "$FILE" > "$TMP"
fi

# Tomamos la primera línea (la siguiente frase en el orden barajado)
frase="$(head -n 1 "$TMP")"

# Imprimimos la frase
echo "$frase"

# Eliminamos esa línea del archivo temporal
sed -i '1d' "$TMP"
