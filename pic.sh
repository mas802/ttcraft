#!/bin/bash

cd gen/

# Text to be added
text="bitte hängen lassen"

# Output PDF file
output_pdf="combined_output.pdf"

# Temporary directory for intermediate files
temp_dir="temp_images"
mkdir -p "$temp_dir"

# Expanded items array
items=("log" "ironore" "sand" "coal" "stone" "flint")

# Max dimension in pixels for 148 cm at 600 DPI
max_dimension=3496

for item in "${items[@]}"; do
    for codefile in oid-998-${item}_*_harvest.png; do 
        # Extract the base name of the codefile without extension
        codefile_base=$(basename "$codefile" .png)
        
        # Define filenames for the intermediate and final images
        temp_image="$temp_dir/${item}_${codefile_base}_resized.png"
        final_image="$temp_dir/${item}_${codefile_base}_combined.png"

        # Step 1: Resize the WebP image and take only the first frame if animated
        magick "../pics/items/harvest/${item}.webp[0]" -resize ${max_dimension}x${max_dimension} "$temp_image"

        # Step 2: Overlay the code image
        magick "$temp_image" "$codefile" -gravity center -compose over -composite "$final_image"

        # Step 3: Add text and resize to A4 with 600 DPI
        magick "$final_image" -gravity center \
            -resize 4961x7016\> -density 600 -units PixelsPerInch -extent 4961x7016 \
            -background white -gravity center "$final_image"
    done
done

items=("goatmeat" "chest" "fish" "gunpowder")

for item in "${items[@]}"; do
    for codefile in oid-998-${item}_*_attack.png; do 
        # Extract the base name of the codefile without extension
        codefile_base=$(basename "$codefile" .png)
        
        # Define filenames for the intermediate and final images
        temp_image="$temp_dir/${item}_${codefile_base}_resized.png"
        final_image="$temp_dir/${item}_${codefile_base}_combined.png"

        # Step 1: Resize the WebP image and take only the first frame if animated
        magick "../pics/items/attack/${item}.webp[0]" -resize ${max_dimension}x${max_dimension} "$temp_image"

        # Step 2: Overlay the code image
        magick "$temp_image" "$codefile" -gravity center -compose over -composite "$final_image"

        # Step 3: Add text and resize to A4 with 600 DPI
        magick "$final_image" -gravity center \
            -resize 4961x7016\> -density 600 -units PixelsPerInch -extent 4961x7016 \
            -background white -gravity center "$final_image"
    done
done

# Combine all the processed images into a PDF with A4 format
magick "$temp_dir"/*_combined.png -page A4 -density 600 -quality 100 "$output_pdf"

# Clean up the temporary directory
# rm -r "$temp_dir"

cd ..
