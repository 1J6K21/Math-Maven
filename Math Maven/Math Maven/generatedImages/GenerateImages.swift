/*
 #!/usr/bin/swift

// This script runs the LessonImageGenerator to create lesson images
// Run with: swift GenerateImages.swift

import Foundation
import UIKit

// MARK: - Image Generation Functions

/// Generates a lesson image for Roman Numerals
func generateRomanNumeralsLessonImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 600, height: 800))
    
    return renderer.image { context in
        // Background
        UIColor.white.setFill()
        context.fill(CGRect(x: 0, y: 0, width: 600, height: 800))
        
        // Title
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 28),
            .foregroundColor: UIColor.black
        ]
        "Roman Numerals".draw(at: CGPoint(x: 200, y: 50), withAttributes: titleAttributes)
        
        // Content
        let contentAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ]
        
        let content = """
        Roman numerals use letters to represent numbers:
        
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
        MMXXIII = 2023
        """
        
        content.draw(at: CGPoint(x: 50, y: 120), withAttributes: contentAttributes)
        
        // Example diagram
        let exampleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: UIColor.blue
        ]
        
        "Example: MCMXCIX = 1999".draw(at: CGPoint(x: 50, y: 600), withAttributes: exampleAttributes)
        
        let breakdownAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.darkGray
        ]
        
        """
        M = 1000
        CM = 900 (1000 - 100)
        XC = 90 (100 - 10)
        IX = 9 (10 - 1)
        
        Total: 1000 + 900 + 90 + 9 = 1999
        """.draw(at: CGPoint(x: 50, y: 640), withAttributes: breakdownAttributes)
    }
}

/// Generates a lesson image for Triangular Numbers
func generateTriangularNumbersLessonImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 600, height: 800))
    
    return renderer.image { context in
        // Background
        UIColor.white.setFill()
        context.fill(CGRect(x: 0, y: 0, width: 600, height: 800))
        
        // Title
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 28),
            .foregroundColor: UIColor.black
        ]
        "Triangular Numbers".draw(at: CGPoint(x: 180, y: 50), withAttributes: titleAttributes)
        
        // Content
        let contentAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ]
        
        let content = """
        Triangular numbers form a triangle pattern:
        
        1st triangular number: 1
        
        2nd triangular number: 1 + 2 = 3
        
        3rd triangular number: 1 + 2 + 3 = 6
        
        4th triangular number: 1 + 2 + 3 + 4 = 10
        
        5th triangular number: 1 + 2 + 3 + 4 + 5 = 15
        
        Formula: T(n) = n(n+1)/2
        
        Example: Find the 5th triangular number
        T(5) = 5(5+1)/2 = 5(6)/2 = 30/2 = 15
        
        Visual representation:
        •        1
        ••
        •••      3
        ••••
        •••••    6
        ••••••
        •••••••  10
        ••••••••
        ••••••••• 15
        """
        
        content.draw(at: CGPoint(x: 50, y: 120), withAttributes: contentAttributes)
    }
}

/// Generates a lesson image for Two by Two Multiplication
func generateTwoByTwoMultiplicationLessonImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 600, height: 800))
    
    return renderer.image { context in
        // Background
        UIColor.white.setFill()
        context.fill(CGRect(x: 0, y: 0, width: 600, height: 800))
        
        // Title
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 28),
            .foregroundColor: UIColor.black
        ]
        "Two by Two Multiplication".draw(at: CGPoint(x: 120, y: 50), withAttributes: titleAttributes)
        
        // Content
        let contentAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ]
        
        let content = """
        Method for multiplying two 2-digit numbers:
        
        Example: 24 × 37
        
        Step 1: Multiply the ones digits
        4 × 7 = 28
        Write down 8, carry 2
        
        Step 2: Cross multiply and add
        (2 × 7) + (4 × 3) = 14 + 12 = 26
        Add the carried 2: 26 + 2 = 28
        Write down 8, carry 2
        
        Step 3: Multiply the tens digits
        2 × 3 = 6
        Add the carried 2: 6 + 2 = 8
        
        Step 4: Combine the results
        24 × 37 = 888
        
        Visual representation:
          24
        × 37
        -----
         168  (24 × 7)
        720   (24 × 30)
        -----
        888
        """
        
        content.draw(at: CGPoint(x: 50, y: 120), withAttributes: contentAttributes)
    }
}

/// Generates a lesson image for Improper Fraction Multiplication
func generateImproperFractionMultiplicationLessonImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 600, height: 800))
    
    return renderer.image { context in
        // Background
        UIColor.white.setFill()
        context.fill(CGRect(x: 0, y: 0, width: 600, height: 800))
        
        // Title
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 28),
            .foregroundColor: UIColor.black
        ]
        "Improper Fraction Multiplication".draw(at: CGPoint(x: 120, y: 50), withAttributes: titleAttributes)
        
        // Content
        let contentAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ]
        
        let content = """
        To multiply improper fractions:
        
        1. Multiply the numerators
        2. Multiply the denominators
        3. Simplify if possible
        
        Example: 7/3 × 5/2
        
        Step 1: Multiply numerators
        7 × 5 = 35
        
        Step 2: Multiply denominators
        3 × 2 = 6
        
        Step 3: Combine
        7/3 × 5/2 = 35/6
        
        Step 4: Convert to mixed number (if needed)
        35 ÷ 6 = 5 remainder 5
        So 35/6 = 5 5/6
        
        Visual representation:
        
        7/3 × 5/2 = (7 × 5)/(3 × 2) = 35/6
        
        Area model:
        •••••••  (7 parts)
        •••••••  (3 rows)
        ×
        •••••    (5 parts)
        ••        (2 rows)
        = 35/6
        """
        
        content.draw(at: CGPoint(x: 50, y: 120), withAttributes: contentAttributes)
    }
}

/// Generates a lesson image for Integer Sequence Sum
func generateIntegerSequenceSumLessonImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 600, height: 800))
    
    return renderer.image { context in
        // Background
        UIColor.white.setFill()
        context.fill(CGRect(x: 0, y: 0, width: 600, height: 800))
        
        // Title
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 28),
            .foregroundColor: UIColor.black
        ]
        "Integer Sequence Sum".draw(at: CGPoint(x: 180, y: 50), withAttributes: titleAttributes)
        
        // Content
        let contentAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ]
        
        let content = """
        Types of Integer Sequences:
        
        1. Consecutive Integers
        Example: 3, 4, 5, 6, 7
        Sum = 3 + 4 + 5 + 6 + 7 = 25
        
        2. Odd Integers
        Example: 3, 5, 7, 9, 11
        Sum = 3 + 5 + 7 + 9 + 11 = 35
        
        3. Even Integers
        Example: 2, 4, 6, 8, 10
        Sum = 2 + 4 + 6 + 8 + 10 = 30
        
        Formulas:
        
        Consecutive integers: n, n+1, n+2, n+3, n+4
        Sum = 5n + 10
        
        Odd integers: n, n+2, n+4, n+6, n+8
        Sum = 5n + 20
        
        Even integers: n, n+2, n+4, n+6, n+8
        Sum = 5n + 20
        
        Example: Find the sum of 5, 6, 7, 8, 9
        Sum = 5 + 6 + 7 + 8 + 9 = 35
        Or using formula: 5(5) + 10 = 25 + 10 = 35
        """
        
        content.draw(at: CGPoint(x: 50, y: 120), withAttributes: contentAttributes)
    }
}

/// Generates a lesson image for Root Approximation
func generateRootApproximationLessonImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 600, height: 800))
    
    return renderer.image { context in
        // Background
        UIColor.white.setFill()
        context.fill(CGRect(x: 0, y: 0, width: 600, height: 800))
        
        // Title
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 28),
            .foregroundColor: UIColor.black
        ]
        "Root Approximation".draw(at: CGPoint(x: 180, y: 50), withAttributes: titleAttributes)
        
        // Content
        let contentAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ]
        
        let content = """
        Approximating Square and Cube Roots:
        
        Square Root Approximation:
        
        Method 1: Guess and Check
        Example: √2500
        
        Try 50: 50² = 2500 ✓
        So √2500 = 50
        
        Method 2: Find perfect squares nearby
        Example: √2600
        
        50² = 2500
        51² = 2601
        
        So √2600 ≈ 51
        
        Cube Root Approximation:
        
        Method 1: Guess and Check
        Example: ∛8000
        
        Try 20: 20³ = 8000 ✓
        So ∛8000 = 20
        
        Method 2: Find perfect cubes nearby
        Example: ∛8500
        
        20³ = 8000
        21³ = 9261
        
        So ∛8500 ≈ 20
        
        Tips:
        - For square roots, look for perfect squares
        - For cube roots, look for perfect cubes
        - Estimate between known values
        - Use calculator for verification
        """
        
        content.draw(at: CGPoint(x: 50, y: 120), withAttributes: contentAttributes)
    }
}

// MARK: - Main Function

/// Generates all lesson images and saves them to the generatedImages directory
func generateAllLessonImages() {
    print("Starting image generation...")
    
    // Get the current directory
    let currentDirectory = FileManager.default.currentDirectoryPath
    let imagesDirectory = "\(currentDirectory)/generatedImages"
    
    // Create directory if it doesn't exist
    let fileManager = FileManager.default
    if !fileManager.fileExists(atPath: imagesDirectory) {
        do {
            try fileManager.createDirectory(atPath: imagesDirectory, withIntermediateDirectories: true)
            print("Created directory: \(imagesDirectory)")
        } catch {
            print("Error creating directory: \(error)")
            return
        }
    }
    
    // Generate and save images
    let images = [
        ("romanNumerals", generateRomanNumeralsLessonImage()),
        ("triangularNumbers", generateTriangularNumbersLessonImage()),
        ("twoByTwoMultiplication", generateTwoByTwoMultiplicationLessonImage()),
        ("improperFractionMultiplication", generateImproperFractionMultiplicationLessonImage()),
        ("integerSequenceSum", generateIntegerSequenceSumLessonImage()),
        ("rootApproximation", generateRootApproximationLessonImage())
    ]
    
    for (name, image) in images {
        if let data = image.pngData() {
            let fileURL = URL(fileURLWithPath: "\(imagesDirectory)/\(name).png")
            do {
                try data.write(to: fileURL)
                print("Generated \(name).png")
            } catch {
                print("Error saving \(name).png: \(error)")
            }
        }
    }
    
    print("All lesson images generated successfully!")
    print("Images saved to: \(imagesDirectory)")
}

// Run the generator
generateAllLessonImages() 

*/
