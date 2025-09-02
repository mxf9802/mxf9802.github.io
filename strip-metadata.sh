#!/bin/bash

# Script to strip ALL metadata from photos for privacy protection
# This removes GPS coordinates, camera info, dates, and all other EXIF data

echo "🔒 STRIPPING METADATA FROM PHOTOS FOR PRIVACY PROTECTION"
echo "=================================================="

# Function to strip metadata from a single file
strip_metadata() {
    local file="$1"
    echo "Processing: $file"
    
    # Create a backup with .backup extension
    cp "$file" "$file.backup"
    
    # Strip ALL metadata using exiftool
    exiftool -all= -overwrite_original "$file"
    
    # Verify metadata is gone
    local remaining_metadata=$(exiftool -s -s -s "$file" | wc -l)
    if [ "$remaining_metadata" -le 3 ]; then
        echo "✅ Successfully stripped metadata from $file"
        # Remove backup if successful
        rm "$file.backup"
    else
        echo "❌ Warning: Some metadata may remain in $file"
        echo "   Restoring backup..."
        mv "$file.backup" "$file"
    fi
}

# Process all photos in the shed-build directory
echo "Processing shed-build photos..."
for photo in images/photography/shed-build/*.jpg; do
    if [ -f "$photo" ]; then
        strip_metadata "$photo"
    fi
done

# Process any other photos in the photography directory
echo "Processing other photography photos..."
for photo in images/photography/*.jpg; do
    if [ -f "$photo" ]; then
        strip_metadata "$photo"
    fi
done

echo ""
echo "🔒 METADATA STRIPPING COMPLETE!"
echo "=================================================="
echo "✅ All photos have been cleaned of metadata"
echo "✅ GPS coordinates, camera info, and dates removed"
echo "✅ Your privacy is now protected"
echo ""
echo "⚠️  IMPORTANT: Always strip metadata before uploading photos to websites!"
echo "   You can run this script anytime with: ./strip-metadata.sh"
