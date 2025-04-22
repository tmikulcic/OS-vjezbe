#!/bin/bash

arg="$1"

if [ "$#" -ne 1 ]; then
  echo "Treba biti tocno jedan argument"
  exit 1
fi

if [[ "$arg" -gt 10 || "$arg" -lt 1  ]]; then
  echo "Argument mora biti broj od 1 do 10"
  exit 1
fi

> brojevi.txt

for ((i = 1; i <= arg; i++)); do
  echo "$i" >> brojevi.txt
done
