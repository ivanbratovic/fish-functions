#!/usr/bin/env bash
set -e

# Change to functions directory or exit with error
cd functions/ || {
    echo "Error: Please run this script from the repository root directory!" >&2
    exit 1
}

# Ensure destination directory exists
dest_dir="$HOME/.config/fish/functions"
mkdir -p "$dest_dir"

echo "Warning! This script can overwrite existing functions in $dest_dir."

function get_single_char_answer(){
    local prompt="$1"
    local answer
    read -r -p "$prompt " answer
    echo "${answer:0:1}" | tr '[:upper:]' '[:lower:]'
}

# Check if any .fish files exist
if ! ls *.fish >/dev/null 2>&1; then
    echo "No source .fish files found!"
    exit 1
fi

# Initialize global answer variable
answer=""

for file in *.fish; do
    dest="$dest_dir/$file"
    
    # Skip if file doesn't exist at destination
    if [ ! -f "$dest" ]; then
        cp "$file" "$dest"
        continue
    fi
    
    # Skip if files are identical
    if diff -q "$dest" "$file" >/dev/null 2>&1; then
        continue
    fi
    
    # Skip prompting if user chose "replace all"
    if [[ "$answer" == "a" ]]; then
        cp "$file" "$dest"
        echo "Installed $file"
        continue
    fi
    
    # Prompt user for action
    answer=$(get_single_char_answer "Replace $file in destination? [(y)es/(N)o/replace (a)ll/(d)iff]")
    
    case "$answer" in
        "y")
            cp "$file" "$dest"
            ;;
        "a")
            cp "$file" "$dest"
            ;;
        "d")
            diff --color --unified=3 "$dest" "$file" || true
            answer=$(get_single_char_answer "Continue with install for $file? [(y)es/(N)o/replace (a)ll] ")
            case "$answer" in
                "y"|"a")
                    cp "$file" "$dest"
                    ;;
                *)
                    echo "Skipping $file"
                    answer=""  # Reset answer to avoid affecting next iteration
                    ;;
            esac
            ;;
        *)
            echo "Skipping $file"
            ;;
    esac
done
