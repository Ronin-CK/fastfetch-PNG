# fastfetch-PNG 🖼️

Use **any PNG image** as your `fastfetch` logo!

## Features
- **Zero Config:** Just drop images into a folder.
- **Auto-Rotation:** Picks a random image on every run.
- **Native Scaling:** Uses `fastfetch`'s native image scaling (no external dependencies like `magick`).
- **Supports:** PNG, JPG, WEBP.

## Installation

```bash
git clone https://github.com/yourusername/fastfetch-PNG.git
cd fastfetch-PNG
chmod +x install.sh
./install.sh
```

### 🐟 Fish Users
The installer adds a `fastfetch` function to your configuration. It just works.

### 🐚 Bash / Zsh Users
The installer copies a wrapper script to `~/.local/bin/fastfetch`.
**Ensure `~/.local/bin` is in your PATH.**
If `fastfetch` doesn't show the random logo, try restarting your terminal or adding this to your `.bashrc` / `.zshrc`:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Usage
1. Run `fastfetch` in your terminal.
2. To add new art, simply save any image to:
   ```
   ~/.config/fastfetch/images/
   ```
3. To remove art, just delete the file from that folder.

## Boxed Layout Config
This repo includes a "Boxed" layout configuration (`config.jsonc`) that groups Hardware and Software info.
To use it:
```bash
cp config/config.jsonc ~/.config/fastfetch/config.jsonc
```
