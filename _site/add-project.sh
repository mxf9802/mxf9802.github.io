#!/bin/bash

# Simple script to add a new project to your Jekyll site
# Usage: ./add-project.sh "Project Name" "Brief Description"

if [ $# -lt 2 ]; then
    echo "Usage: $0 \"Project Name\" \"Brief Description\""
    echo "Example: $0 \"Wooden Bench\" \"A handcrafted oak bench for the garden\""
    exit 1
fi

PROJECT_NAME="$1"
PROJECT_DESC="$2"

# Convert project name to URL-friendly format
PROJECT_SLUG=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')

# Get current date in YYYY-MM-DD format
DATE=$(date +%Y-%m-%d)

# Create the project post file
POST_FILE="projects/_posts/${DATE}-${PROJECT_SLUG}.markdown"

echo "Creating project: $PROJECT_NAME"
echo "Post file: $POST_FILE"

# Create the project post content
cat > "$POST_FILE" << EOF
---
layout: project-post
title: "$PROJECT_NAME"
subtitle: "$PROJECT_DESC"
share: false
comments: false
tags: [Projects]
thumbnail-img: "/images/photography/${PROJECT_SLUG}/thumbnail.jpg"
image:
  thumbnail: "/images/photography/${PROJECT_SLUG}/thumbnail.jpg"
---

Write your project description here. This is where you tell the story of your project - what inspired you, what challenges you faced, how you solved them, and what you learned along the way.

You can write multiple paragraphs and include details about:
- The planning process
- Materials and tools used
- Challenges encountered
- Solutions implemented
- Final results and lessons learned

{% include modal-gallery.html album="${PROJECT_SLUG}" %}
EOF

echo "✅ Project post created: $POST_FILE"
echo ""
echo "Next steps:"
echo "1. Create a folder: images/photography/${PROJECT_SLUG}/"
echo "2. Add your project photos to that folder"
echo "3. Rename one photo to 'thumbnail.jpg' for the project thumbnail"
echo "4. 🔒 IMPORTANT: Run './strip-metadata.sh' to remove GPS/location data from photos"
echo "5. Edit the post file to add your project description"
echo "6. Run 'bundle exec jekyll build' to rebuild the site"
echo ""
echo "📁 Project folder: images/photography/${PROJECT_SLUG}/"
echo "📝 Edit post: $POST_FILE"
echo "🔒 Privacy: Always strip metadata before uploading photos!"
