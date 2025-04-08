# Math Maven Lesson Images

This directory contains generated lesson images for the Math Maven app. These images provide educational content for each problem type.

## Available Lesson Images

1. **Roman Numerals** - Explains Roman numeral rules and conversion
2. **Triangular Numbers** - Shows how to calculate triangular numbers
3. **Two by Two Multiplication** - Demonstrates methods for multiplying two-digit numbers
4. **Improper Fraction Multiplication** - Explains how to multiply improper fractions
5. **Integer Sequence Sum** - Covers different types of integer sequences and their sums
6. **Root Approximation** - Shows methods for approximating square and cube roots

## How to Generate Images

There are multiple ways to generate the lesson images:

### Option 1: Using the shell script (recommended)

1. Make sure you have Swift installed on your system
2. Navigate to the Math Maven directory in your terminal
3. Run the shell script:
   ```
   ./generate_images.sh
   ```

### Option 2: Using the Python script

1. Make sure you have Python 3 and the Pillow library installed
   ```
   pip install Pillow
   ```
2. Navigate to the Math Maven directory in your terminal
3. Run the Python script:
   ```
   ./generate_images.py
   ```

### Option 3: Running the Swift script directly

1. Make sure you have Swift installed on your system
2. Navigate to the Math Maven directory in your terminal
3. Run the Swift script:
   ```
   ./generatedImages/GenerateImages.swift
   ```

The scripts will:
- Create a `generatedImages` directory if it doesn't exist
- Generate PNG images for each problem type
- Save the images to the `generatedImages` directory
- Print progress information to the terminal

## Image Format

Each image is a PNG file with dimensions 600x800 pixels. The images contain:
- A title
- Educational content explaining the concept
- Examples and visual representations
- Step-by-step instructions where applicable

## Using the Images in the App

These images can be used in the Math Maven app to provide educational content for each problem type. They can be displayed when a user needs help with a particular problem type. 