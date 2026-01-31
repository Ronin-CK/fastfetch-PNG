# fastfetch-PNG 🖼️

Use **any PNG image** as your `fastfetch` logo!

## Features

- **Zero Config:** Just drop images into a folder.
- **Auto-Rotation:** Picks a random image on every run.
- **Native Scaling:** Uses `fastfetch`'s native image scaling.
- **Supports:** PNG, JPG, WEBP.

## Installation

```bash
git clone https://github.com/Ronin-CK/fastfetch-PNG.git
cd fastfetch-PNG
chmod +x install.sh
./install.sh
```

### 🐟 Fish Users

The installer adds a `fastfetch` function to your configuration. It just works.

### 🐚 Bash / Zsh Users

The installer copies a wrapper script to `~/.local/bin/fastfetch`.
**Ensure `~/.local/bin` is in your PATH.**

## Usage

1. Run `fastfetch` in your terminal.
2. To add new art, simply save any image to:
   ```
   ~/.config/fastfetch/images/
   ```
3. To remove art, just delete the file from that folder.

## 🎌 Image Packs

Want some anime art? Check out:

- **[fastfetchPNG-images](https://github.com/Ronin-CK/fastfetchPNG-images)** — One Piece, Demon Slayer, and more!

Install an image pack:

```bash
git clone https://github.com/Ronin-CK/fastfetchPNG-images.git
cp fastfetchPNG-images/*.png ~/.config/fastfetch/images/
```

## Boxed Layout Config

This repo includes a "Boxed" layout configuration (`config.jsonc`).

```bash
cp config/config.jsonc ~/.config/fastfetch/config.jsonc
```
