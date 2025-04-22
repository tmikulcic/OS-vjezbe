#!/bin/bash

dir="$1"
ext="$2"

if [ "$#" -ne 2 ]; then
    echo "Potrebno je proslijediti tocno dva argumenta"
    exit 1
fi

if [ ! -d "$dir" ]; then
    echo "Direktorij ne postoji"
    exit 1
fi

found=0

for file in "$dir"/*"$ext"; do
    if [ -f "$file" ]; then
        echo "$(basename "$file")"
        found=1
    fi
done

if [ "$found" -eq 0 ]; then
    echo "Takva datoteka ne postoji"
fi