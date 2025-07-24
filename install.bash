#!/usr/bin/env bash
cd functions/ || echo "Please run this script in the repository root!"

echo "Warning! This script can overwrite existing functions in ~/.config/fish/functions."

function get_single_char_answer(){
    prompt="$1"
    read -r -p "$prompt " answer
    echo "${answer:0:1}" | tr '[:upper:]' '[:lower:]'
}

for file in *.fish; do
    dest="$HOME/.config/fish/functions/$file"
    if  [ -f "$dest" ]; then
        if diff -q $dest $file >/dev/null; then
            continue
        elif [[ "$answer" != "a" && "$answer" != "r" ]]; then
            answer=$(get_single_char_answer "Replace $file in destination? [(y)es/(N)o/replace (a)ll/(d)iff]")
            if [[ -z "$answer" || "$answer" == "n" ]]; then
                continue
            elif [[ "$answer" == "d" ]]; then
                diff --color --unified=3 $dest $file
                answer=$(get_single_char_answer "Continue with overwrite? [(y)es/(N)o/replace (a)ll] ")
                if [[ -z "$answer" || "$answer" == "n" ]]; then
                    continue
                fi
            fi
        fi
    fi
    cp "$file" "$dest"
done

if [[ "$answer" == "a" || "$answer" == "r" ]]; then
    echo "Replaced ALL existing functions in ~/.config/fish/functions."
fi