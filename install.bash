#!/usr/bin/env bash
cd functions/ || echo "Please run this script in the repository root!"

echo "Warning! This script can overwrite existing functions in ~/.config/fish/functions."

for file in *.fish; do
    dest="$HOME/.config/fish/functions/$file"
    if  [ -f "$dest" ]; then
        if [ "$answer" != "a" ]; then
            read -r -p "Replace $file in destination? [(y)es/(N)o/replace (a)ll] " answer
            answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
            if [[ -z "$answer" || "$answer" == "n" ]]; then
                continue
            fi
        fi
    fi
    cp "$file" "$dest"
done

if [ "$answer" == "a" ]; then
    echo "Replaced all existing functions in ~/.config/fish/functions."
fi