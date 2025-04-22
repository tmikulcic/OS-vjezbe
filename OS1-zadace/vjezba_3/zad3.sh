#!/bin/bash

path=./screenshots
counter=1

for file in "$path"/*; do
    if [ -f "$file" ]; then
	filename=$(basename "$file")
	newname="screenshots_${counter}_${filename}"
  mv "$file" "$path/$newname"
	counter=$((counter + 1))
    fi
done
	
