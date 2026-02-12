#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Installing fastfetch-PNG...${NC}"

# 1. Create Images Directory
IMAGES_DIR="$HOME/.config/fastfetch/images"
if [ ! -d "$IMAGES_DIR" ]; then
    echo "Creating images directory: $IMAGES_DIR"
    mkdir -p "$IMAGES_DIR"
else
    echo "Images directory already exists: $IMAGES_DIR"
fi

# 2. Install Shell Scripts
FISH_FUNC_DIR="$HOME/.config/fish/functions"
LOCAL_BIN="$HOME/.local/bin"

if [[ "$SHELL" == *"fish"* ]]; then
    echo "Fish shell detected. Installing function..."
    mkdir -p "$FISH_FUNC_DIR"
    cp shell/fastfetch.fish "$FISH_FUNC_DIR/"
else
    echo "Non-Fish shell detected (Bash/Zsh/etc)."
    echo "Installing wrapper script to $LOCAL_BIN..."
    mkdir -p "$LOCAL_BIN"
    cp shell/fastfetch-wrapper.sh "$LOCAL_BIN/fastfetch"
    chmod +x "$LOCAL_BIN/fastfetch"
    echo "NOTE: Make sure $LOCAL_BIN is in your PATH."
fi

# 3. Install Sample Image
if [ -z "$(ls -A $IMAGES_DIR)" ]; then
    echo "Directory empty, adding sample image..."
    cp examples/sample_logo.png "$IMAGES_DIR/"
fi


# 4. Auto-Start Prompt
echo -e "${BLUE}------------------------------------------------${NC}"
echo -e "Would you like to run fastfetch automatically when your terminal opens? [y/N]"
read -r AUTOSTART

if [[ "$AUTOSTART" =~ ^[Yy]$ ]]; then
    # Detect shell and config file
    if [[ "$SHELL" == *"fish"* ]]; then
        CONFIG_FILE="$HOME/.config/fish/config.fish"
        # Fish needs to add inside the interactive block or at end
        if ! grep -q "fastfetch" "$CONFIG_FILE" 2>/dev/null; then
            echo -e "\n    # fetchPNG: Run fastfetch on startup\n    fastfetch" >> "$CONFIG_FILE"
            echo -e "${GREEN}Added fastfetch to $CONFIG_FILE${NC}"
        else
            echo "fastfetch already in $CONFIG_FILE"
        fi
    elif [[ "$SHELL" == *"zsh"* ]]; then
        CONFIG_FILE="$HOME/.zshrc"
        if ! grep -q "fastfetch" "$CONFIG_FILE" 2>/dev/null; then
            echo -e "\n# fetchPNG: Run fastfetch on startup\nfastfetch" >> "$CONFIG_FILE"
            echo -e "${GREEN}Added fastfetch to $CONFIG_FILE${NC}"
        else
            echo "fastfetch already in $CONFIG_FILE"
        fi
    else
        # Assume bash
        CONFIG_FILE="$HOME/.bashrc"
        if ! grep -q "fastfetch" "$CONFIG_FILE" 2>/dev/null; then
            echo -e "\n# fetchPNG: Run fastfetch on startup\nfastfetch" >> "$CONFIG_FILE"
            echo -e "${GREEN}Added fastfetch to $CONFIG_FILE${NC}"
        else
            echo "fastfetch already in $CONFIG_FILE"
        fi
    fi
else
    echo "Skipped auto-start. You can add 'fastfetch' to your shell config later."
fi

echo -e "${BLUE}------------------------------------------------${NC}"
echo -e "${GREEN}Installation Complete!${NC}"
echo -e "Run ${GREEN}fastfetch${NC} to see the magic."
echo -e "Drop any PNG/JPG images into ${GREEN}$IMAGES_DIR${NC} to add them to the rotation."
