#!/bin/bash

# Fastfetch Random Logo Wrapper
# Works on Bash, Zsh, and basic sh

IMG_DIR="$HOME/.config/fastfetch/images"

# Check if directory exists and has files
if [ -d "$IMG_DIR" ]; then
    # Find all image files
    IMAGES=$(find "$IMG_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) 2>/dev/null)
    
    if [ -n "$IMAGES" ]; then
        # Pick one random line
        RANDOM_IMG=$(echo "$IMAGES" | shuf -n 1)
        
        # Run fastfetch with the logo
        exec fastfetch --logo "$RANDOM_IMG" "$@"
    else
        # No images found, just run fastfetch
        exec fastfetch "$@"
    fi
else
    # Directory missing, just run fastfetch
    exec fastfetch "$@"
fi
