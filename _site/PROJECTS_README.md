# Easy Project Creation System

This system makes it super easy to add new projects to your website. Here's how to use it:

## Quick Start

### 1. Run the Add Project Script
```bash
./add-project.sh "Your Project Name" "Brief description"
```

Example:
```bash
./add-project.sh "Wooden Bench" "A handcrafted oak bench for the garden"
```

### 2. Add Your Photos
1. Create the folder: `images/photography/your-project-name/`
2. Add all your project photos to that folder
3. Rename one photo to `thumbnail.jpg` (this will be the main project image)

### 3. Edit the Project Description
Edit the generated file in `projects/_posts/` to add your project story.

### 4. Rebuild the Site
```bash
bundle exec jekyll build
```

## Example Workflow

```bash
# 1. Create a new project
./add-project.sh "Garden Shed" "A custom-built storage shed for the backyard"

# 2. Add photos
mkdir -p images/photography/garden-shed/
# Copy your photos to images/photography/garden-shed/
# Rename one photo to thumbnail.jpg

# 3. Edit the project description
# Edit projects/_posts/YYYY-MM-DD-garden-shed.markdown

# 4. Rebuild
bundle exec jekyll build
```

## Project Structure

```
images/photography/your-project/
├── thumbnail.jpg          # Main project image
├── photo1.jpg            # Gallery photos
├── photo2.jpg
└── photo3.jpg

projects/_posts/
└── YYYY-MM-DD-your-project.markdown  # Project post
```

## Tips

- Use descriptive project names
- Keep photo filenames simple (no spaces)
- Write engaging descriptions to tell your project story
- The thumbnail photo should be your best/most representative image
- All photos in the project folder will appear in the gallery

## What Gets Generated

The script automatically creates:
- ✅ A properly formatted Jekyll post
- ✅ Correct front matter with layout, tags, and image paths
- ✅ Modal gallery integration
- ✅ Proper URL structure

You just need to:
- Add photos to the folder
- Write your project description
- Rebuild the site

That's it! Your project will appear on the projects page with a beautiful gallery.
