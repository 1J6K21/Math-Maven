#!/bin/bash

# generate_images.sh
# This script attempts to generate lesson images using either Swift or Python

echo "Math Maven Image Generator"
echo "========================="
echo ""

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Try Swift first
if command_exists swift; then
    echo "Swift is installed, attempting Swift generator..."
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    SWIFT_SCRIPT="$SCRIPT_DIR/generatedImages/GenerateImages.swift"

    if [ -f "$SWIFT_SCRIPT" ]; then
        chmod +x "$SWIFT_SCRIPT"
        if "$SWIFT_SCRIPT"; then
            echo "Images generated successfully with Swift!"
            exit 0
        fi
    fi
    echo "Swift generation failed, trying Python..."
fi

# Try Python as fallback
if command_exists python3; then
    echo "Checking Python dependencies..."
    if ! python3 -c "import PIL" &> /dev/null; then
        echo "Installing Pillow library..."
        pip3 install Pillow
    fi
    
    PYTHON_SCRIPT="$SCRIPT_DIR/generate_images.py"
    if [ -f "$PYTHON_SCRIPT" ]; then
        chmod +x "$PYTHON_SCRIPT"
        if python3 "$PYTHON_SCRIPT"; then
            echo "Images generated successfully with Python!"
            exit 0
        fi
    fi
    echo "Python generation failed."
fi

echo "Error: Could not generate images with either Swift or Python"
echo "Please ensure either Swift with UIKit or Python 3 with Pillow is installed"
exit 1 