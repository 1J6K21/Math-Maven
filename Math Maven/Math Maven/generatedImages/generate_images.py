#!/usr/bin/env python3

"""
Math Maven Image Generator
This script generates lesson images for the Math Maven app using Python.
"""

import os
import sys
import subprocess
from PIL import Image, ImageDraw, ImageFont

def check_swift():
    """Check if Swift is installed."""
    try:
        subprocess.run(['swift', '--version'], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return True
    except (subprocess.SubprocessError, FileNotFoundError):
        return False

def generate_images_with_swift():
    """Generate images using the Swift script."""
    script_dir = os.path.dirname(os.path.abspath(__file__))
    swift_script = os.path.join(script_dir, 'generatedImages', 'GenerateImages.swift')
    
    if not os.path.exists(swift_script):
        print(f"Error: Swift script not found at {swift_script}")
        return False
    
    try:
        # Make sure the script is executable
        os.chmod(swift_script, 0o755)
        
        # Run the Swift script
        result = subprocess.run(['swift', swift_script], check=True)
        return result.returncode == 0
    except subprocess.SubprocessError as e:
        print(f"Error running Swift script: {e}")
        return False

def generate_roman_numerals_image():
    """Generate a Roman numerals lesson image using Python."""
    # Create a new image with a white background
    img = Image.new('RGB', (600, 800), color='white')
    draw = ImageDraw.Draw(img)
    
    # Try to load a font, fall back to default if not available
    try:
        title_font = ImageFont.truetype("Arial", 28)
        content_font = ImageFont.truetype("Arial", 18)
        example_font = ImageFont.truetype("Arial", 20)
        breakdown_font = ImageFont.truetype("Arial", 16)
    except IOError:
        title_font = ImageFont.load_default()
        content_font = ImageFont.load_default()
        example_font = ImageFont.load_default()
        breakdown_font = ImageFont.load_default()
    
    # Draw title
    draw.text((200, 50), "Roman Numerals", fill='black', font=title_font)
    
    # Draw content
    content = """Roman numerals use letters to represent numbers:

I = 1
V = 5
X = 10
L = 50
C = 100
D = 500
M = 1000

Rules:
1. Numbers are formed by combining symbols
2. When a smaller value precedes a larger value, subtract it
   Example: IV = 5 - 1 = 4
3. When a smaller value follows a larger value, add it
   Example: VI = 5 + 1 = 6

Common combinations:
IV = 4
IX = 9
XL = 40
XC = 90
CD = 400
CM = 900

Examples:
MCMXCIX = 1999
MMXXIII = 2023"""
    
    # Draw content line by line
    y = 120
    for line in content.split('\n'):
        draw.text((50, y), line, fill='black', font=content_font)
        y += 25
    
    # Draw example
    draw.text((50, 600), "Example: MCMXCIX = 1999", fill='blue', font=example_font)
    
    # Draw breakdown
    breakdown = """M = 1000
CM = 900 (1000 - 100)
XC = 90 (100 - 10)
IX = 9 (10 - 1)

Total: 1000 + 900 + 90 + 9 = 1999"""
    
    y = 640
    for line in breakdown.split('\n'):
        draw.text((50, y), line, fill='darkgray', font=breakdown_font)
        y += 25
    
    # Save the image
    script_dir = os.path.dirname(os.path.abspath(__file__))
    output_dir = os.path.join(script_dir, 'generatedImages')
    os.makedirs(output_dir, exist_ok=True)
    
    img.save(os.path.join(output_dir, 'romanNumerals.png'))
    print("Generated romanNumerals.png")
    return True

def generate_all_images_with_python():
    """Generate all lesson images using Python."""
    print("Generating images with Python...")
    
    # Create output directory
    script_dir = os.path.dirname(os.path.abspath(__file__))
    output_dir = os.path.join(script_dir, 'generatedImages')
    os.makedirs(output_dir, exist_ok=True)
    
    # Generate images
    generate_roman_numerals_image()
    # Add more image generation functions here
    
    print(f"All lesson images generated successfully!")
    print(f"Images saved to: {output_dir}")
    return True

def main():
    """Main function."""
    print("Math Maven Image Generator")
    print("=========================")
    print("")
    
    # Check if Swift is installed
    if check_swift():
        print("Swift is installed. Attempting to generate images with Swift...")
        if generate_images_with_swift():
            return
    
    # Fall back to Python if Swift fails or is not available
    print("Falling back to Python for image generation...")
    generate_all_images_with_python()

if __name__ == "__main__":
    main() 