#!/bin/bash

naziv_dir="$1"

if [ "$#" -ne 1 ]; then
    echo "Skripta prima samo jedan argument"
    exit 1
fi

if [ ! -d "./$naziv_dir" ]; then
    echo "Direktorij ne postoji"
    exit 1
fi

if [ -z "$(ls -A "$naziv_dir")" ]; then
    echo "Direktorij je prazan."
    exit 1
fi

zip -j svi_zapisi.zip "$naziv_dir"/*

echo "Datoteke iz direktorija '$naziv_dir' su komprimirane u svi_zapisi.zip"
