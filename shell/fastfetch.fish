function fastfetch
    set -l img_dir "$HOME/.config/fastfetch/images"
    
    # Robust find for images
    set -l images (find "$img_dir" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \))

    if test (count $images) -gt 0
        # Select random image
        set -l random_img (printf "%s\n" $images | shuf -n 1)
        
        # Pass directly to fastfetch without cropping
        # Fastfetch will handle resizing to fit the text height
        command fastfetch --logo "$random_img" $argv
    else
        # No images found, run default
        command fastfetch $argv
    end
end
