//
//  Problems.swift
//  rest
//
//  Created by kalsky_953982 on 2/12/25.
//

import Swift
import Foundation
import SwiftUI

/*
// Add at the top of the file, after imports
enum AnswerType {
    case integer(Int)
    case decimal(Double, Int) // value and decimal places
    case fraction(Int, Int) // numerator and denominator
    case mixedNumber(Int, Int, Int) // whole number, numerator, denominator
    case percent(Double) // percentage value
    case money(Double) // monetary value
    case improperFraction(Int, Int) // numerator and denominator (numerator > denominator)
    case approximation(Double, Double) // exact value and tolerance percentage
    case complex(Int, Int) // real and imaginary parts
}

*/


/*
//Problem 1
///this is always an addition/subtraction string of numbers 2-4 digits
///returns (problem string, answer int, help image, questionID)
func IntegerSimplification() -> (String, AnswerType, UIImage, Int) {
    let asset = UIImage(resource: .intSimplification)
    
    // Generate numbers that demonstrate various simplification techniques
    let technique = Int.random(in: 0...4)
    var numbers: [Int] = []
    var answer = 0
    
    switch technique {
    case 0: // Large numbers with complementary pairs
        let base = Int.random(in: 1000...4000)
        let complement = 10000 - base
        numbers = [base, complement]
        answer = 10000
        
    case 1: // Multiple large numbers with common factors
        let factor = Int.random(in: 100...200)
        let count = Int.random(in: 3...4)
        for _ in 0..<count {
            numbers.append(Int.random(in: 2...5) * factor)
        }
        answer = numbers.reduce(0, +)
        
    case 2: // Large numbers with alternating signs
        let base = Int.random(in: 2000...5000)
        let adjustment = Int.random(in: 100...500)
        numbers = [base, -(base - adjustment)]
        answer = adjustment
        
    case 3: // Multiple large numbers with distributive property
        let base = Int.random(in: 1000...3000)
        let factor = Int.random(in: 2...4)
        let count = Int.random(in: 2...3)
        for _ in 0..<count {
            numbers.append(base * factor)
        }
        answer = base * factor * count
        
    case 4: // Large numbers with round and adjust
        let base = Int.random(in: 3000...6000)
        let adjustment = Int.random(in: -200...200)
        numbers = [base, adjustment]
        answer = base + adjustment
        
    default:
        // Generate 2-4 random large numbers
        let count = Int.random(in: 2...4)
        for _ in 0..<count {
            numbers.append(Int.random(in: 1000...9999))
        }
        answer = numbers.reduce(0, +)
    }
    
    // Format the question in UIL style with proper spacing
    let question = numbers.map { String(format: "%+d", $0) }.joined(separator: " ")
    
    return (question, .integer(answer), asset, 1)
}

//Problem 1 Supplement
///This function generates addition/subtraction problems using common factors and mathematical relationships
func CommonFactors() -> (String, AnswerType, UIImage, Int) {
    let asset = UIImage(resource: .intSimplification)
    
    let technique = Int.random(in: 0...4)
    var numbers: [Int] = []
    var answer = 0
    
    switch technique {
    case 0: // Complementary pairs that sum to 100
        let base = Int.random(in: 30...70)
        let factor = Int.random(in: 2...5)
        numbers = [base * factor, (100 - base) * factor]
        answer = 100 * factor
        
    case 1: // Double and half with common factor
        let commonFactor = Int.random(in: 2...5)
        let num = Int.random(in: 20...40)
        numbers = [num * commonFactor, num * 2 * commonFactor]
        answer = num * 3 * commonFactor
        
    case 2: // Round and adjust with distributive property
        let base = Int.random(in: 20...40) * 10
        let adjustment = Int.random(in: -5...5)
        let factor = Int.random(in: 2...5)
        numbers = [(base + adjustment) * factor, (base - adjustment) * factor]
        answer = base * 2 * factor
        
    case 3: // Break into friendly parts with common factor
        let commonFactor = Int.random(in: 2...5)
        let num1 = Int.random(in: 10...20)
        let num2 = Int.random(in: 10...20)
        numbers = [num1 * commonFactor, num2 * commonFactor]
        answer = (num1 + num2) * commonFactor
        
    case 4: // Additive inverse with distributive property
        let commonFactor = Int.random(in: 2...5)
        let num = Int.random(in: 20...40)
        numbers = [num * commonFactor, -num * commonFactor]
        answer = 0
        
    default:
        // Generate 2-3 numbers with common factors
        let commonFactor = Int.random(in: 2...5)
        let count = Int.random(in: 2...3)
        for _ in 0..<count {
            numbers.append(Int.random(in: 10...20) * commonFactor)
        }
        answer = numbers.reduce(0, +)
    }
    
    // Format the question in UIL style
    let question = numbers.map { String(format: "%+d", $0) }.joined(separator: " ")
    
    return (question, .integer(answer), asset, 1)
}
 */


//Problem 2
///this is always a division problem with a remainder
///returns (problem string, answer int, help image, questionID)
func RemainderQuestion() -> (String, AnswerType, UIImage, Int) {
    let asset = UIImage(resource: .remainders)
    
    // Generate numbers that demonstrate various remainder techniques
    let technique = Int.random(in: 0...6) // Changed from 0...5 to 0...6 to include new case
    var dividend: Int
    var divisor: Int
    var answer: Int
    
    switch technique {
    case 0: // Use 9's remainder rule with multiple digits
        let digits = (0...3).map { _ in Int.random(in: 1...9) }
        dividend = digits.reduce(0) { $0 * 10 + $1 }
        divisor = 9
        answer = (dividend % 9 + 9) % 9
        
    case 1: // Use 3's remainder rule with alternating sum
        let digits = (0...3).map { _ in Int.random(in: 1...9) }
        dividend = digits.reduce(0) { $0 * 10 + $1 }
        divisor = 3
        answer = (dividend % 3 + 3) % 3
        
    case 2: // Use 4's remainder rule with last two digits
        let lastTwo = Int.random(in: 10...99)
        let prefix = Int.random(in: 1...9)
        dividend = prefix * 100 + lastTwo
        divisor = 4
        answer = (lastTwo % 4 + 4) % 4
        
    case 3: // Use 8's remainder rule with last three digits
        let lastThree = Int.random(in: 100...999)
        let prefix = Int.random(in: 1...9)
        dividend = prefix * 1000 + lastThree
        divisor = 8
        answer = (lastThree % 8 + 8) % 8
        
    case 4: // Use 11's remainder rule with alternating sum
        let digits = (0...3).map { _ in Int.random(in: 1...9) }
        dividend = digits.reduce(0) { $0 * 10 + $1 }
        divisor = 11
        let alternatingSum = digits.enumerated().reduce(0) { sum, pair in
            sum + (pair.offset % 2 == 0 ? pair.element : -pair.element)
        }
        answer = (alternatingSum % 11 + 11) % 11
        
    case 5: // Use 7's remainder rule with alternating groups of 3
        let digits = (0...5).map { _ in Int.random(in: 1...9) }
        dividend = digits.reduce(0) { $0 * 10 + $1 }
        divisor = 7
        let groups = stride(from: 0, to: digits.count, by: 3).map { start in
            let end = min(start + 3, digits.count)
            return digits[start..<end].reduce(0) { $0 * 10 + $1 }
        }
        let alternatingSum = groups.enumerated().reduce(0) { sum, pair in
            sum + (pair.offset % 2 == 0 ? pair.element : -pair.element)
        }
        answer = (alternatingSum % 7 + 7) % 7
        
    case 6: // Large number with unused divisor
        let numDigits = Int.random(in: 5...7)
        let digits = (0..<numDigits).map { _ in Int.random(in: 1...9) }
        dividend = digits.reduce(0) { $0 * 10 + $1 }
        // Use divisors not used in other cases (2, 5, 6, 10, 12, 13, etc.)
        let unusedDivisors = [2, 5, 6, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20]
        divisor = unusedDivisors.randomElement() ?? 2
        answer = dividend % divisor
        
    default:
        dividend = Int.random(in: 100...999)
        divisor = Int.random(in: 2...9)
        answer = dividend % divisor
    }
    
    let question = "\(dividend) ÷ \(divisor) has remainder"
    
    return (question, .integer(answer), asset, 2)
}

//Problem 3
func SimpleRatio() -> (String, AnswerType, UIImage, Int) {
    let asset = UIImage(resource: .squares)
    let ratio1 = Int.random(in: 1...10)
    let ratio2 = Int.random(in: 1...10)
    let value = Int.random(in: 10...50)
    let answer = (value * ratio2) / ratio1
    
    let question = "If \(ratio1):\(ratio2) = \(value):x, then x ="
    return (question, .integer(answer), asset, 25)
}
        
    // Problem 26
    func SimplePercent() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various percentage techniques
        let technique = Int.random(in: 0...4)
        var number: Int
        var percent: Int
        var answer: Double
        
        switch technique {
        case 0: // Use numbers that make percentage calculation easier (10%, 25%, 50%, 75%)
            let easyPercents = [10, 25, 50, 75]
            percent = easyPercents.randomElement()!
            number = Int.random(in: 100...1000)
            answer = Double(number) * Double(percent) / 100.0
            
        case 1: // Use numbers that can be broken down into known percentages
            percent = Int.random(in: 15...85)
            number = Int.random(in: 100...1000)
            answer = Double(number) * Double(percent) / 100.0
            
        case 2: // Use numbers near powers of 10
            let power = Int.random(in: 2...3)
            let base = Int(pow(10.0, Double(power)))
            number = base + Int.random(in: -50...50)
            percent = Int.random(in: 10...90)
            answer = Double(number) * Double(percent) / 100.0
            
        case 3: // Use numbers that form patterns
            let pattern = Int.random(in: 2...5)
            number = pattern * Int.random(in: 20...50)
            percent = pattern * Int.random(in: 10...20)
            answer = Double(number) * Double(percent) / 100.0
            
        case 4: // Use numbers with complementary percentages
            percent = Int.random(in: 10...45)
            number = Int.random(in: 100...1000)
            answer = Double(number) * Double(percent) / 100.0
            
        default:
            number = Int.random(in: 100...1000)
            percent = Int.random(in: 1...100)
            answer = Double(number) * Double(percent) / 100.0
        }
        
        let question = "\(percent)% of \(number)"
        return (question, .decimal(answer, 0), asset, 26)
    }
    
    // Problem 27
    func SimpleInterest() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various interest calculation techniques
        let technique = Int.random(in: 0...4)
        var principal: Int
        var rate: Double
        var time: Int
        var answer: Double
        
        switch technique {
        case 0: // Use round numbers for easy calculation
            principal = Int.random(in: 1000...5000)
            rate = Double.random(in: 5...15)
            time = Int.random(in: 1...3)
            answer = Double(principal) * rate * Double(time) / 100.0
            
        case 1: // Use numbers that demonstrate percentage relationships
            principal = Int.random(in: 2000...4000)
            rate = 10.0 // 10% for easy mental calculation
            time = Int.random(in: 2...4)
            answer = Double(principal) * rate * Double(time) / 100.0
            
        case 2: // Use numbers near powers of 10
            let power = Int.random(in: 3...4)
            principal = Int(pow(10.0, Double(power))) + Int.random(in: -500...500)
            rate = Double.random(in: 8...12)
            time = Int.random(in: 1...2)
            answer = Double(principal) * rate * Double(time) / 100.0
            
        case 3: // Use numbers that form patterns
            principal = Int.random(in: 1500...2500) * 2
            rate = Double.random(in: 6...8)
            time = 2
            answer = Double(principal) * rate * Double(time) / 100.0
            
        case 4: // Use numbers with complementary factors
            principal = Int.random(in: 1200...1800)
            rate = 12.5 // 12.5% for easy mental calculation (1/8)
            time = Int.random(in: 1...2)
            answer = Double(principal) * rate * Double(time) / 100.0
            
        default:
            principal = Int.random(in: 1000...5000)
            rate = Double.random(in: 5...15)
            time = Int.random(in: 1...3)
            answer = Double(principal) * rate * Double(time) / 100.0
        }
        
        let question = "Simple interest on $\(principal) at \(String(format: "%.1f", rate))% for \(time) year\(time > 1 ? "s" : "") = $"
        
        return (question, .decimal(answer, 2), asset, 27)
    }
    
    // Problem 28
    func SimplePerimeter() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various perimeter calculation techniques
        let technique = Int.random(in: 0...4)
        var length: Int
        var width: Int
        var answer: Int
        
        switch technique {
        case 0: // Use numbers that form perfect squares
            length = Int.random(in: 10...20)
            width = length
            answer = 4 * length
            
        case 1: // Use numbers with a common difference
            length = Int.random(in: 15...25)
            width = length - Int.random(in: 2...5)
            answer = 2 * (length + width)
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 4...5)
            length = Int(pow(2.0, Double(power))) + Int.random(in: -2...2)
            width = Int(pow(2.0, Double(power))) - Int.random(in: -2...2)
            answer = 2 * (length + width)
            
        case 3: // Use numbers that form rectangles with integer diagonals
            length = Int.random(in: 12...16) * 2
            width = Int.random(in: 9...12) * 2
            answer = 2 * (length + width)
            
        case 4: // Use numbers with complementary factors
            length = Int.random(in: 18...24)
            width = length - Int.random(in: 3...6)
            answer = 2 * (length + width)
            
        default:
            length = Int.random(in: 10...20)
            width = Int.random(in: 10...20)
            answer = 2 * (length + width)
        }
        
        let question = "Perimeter of a rectangle with length \(length) and width \(width) = "
        
        return (question, .integer(answer), asset, 28)
    }
    
    // Problem 29
    func SimpleArea() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various area calculation techniques
        let technique = Int.random(in: 0...4)
        var length: Int
        var width: Int
        var answer: Int
        
        switch technique {
        case 0: // Use numbers that form perfect squares
            length = Int.random(in: 10...20)
            width = length
            answer = length * width
            
        case 1: // Use numbers with a common difference
            length = Int.random(in: 15...25)
            width = length - Int.random(in: 2...5)
            answer = length * width
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 4...5)
            length = Int(pow(2.0, Double(power))) + Int.random(in: -2...2)
            width = Int(pow(2.0, Double(power))) - Int.random(in: -2...2)
            answer = length * width
            
        case 3: // Use numbers that form rectangles with integer diagonals
            length = Int.random(in: 12...16) * 2
            width = Int.random(in: 9...12) * 2
            answer = length * width
            
        case 4: // Use numbers with complementary factors
            length = Int.random(in: 18...24)
            width = length - Int.random(in: 3...6)
            answer = length * width
            
        default:
            length = Int.random(in: 10...20)
            width = Int.random(in: 10...20)
            answer = length * width
        }
        
        let question = "Area of a rectangle with length \(length) and width \(width) = "
        
        return (question, .integer(answer), asset, 29)
    }
    
    // Problem 30
    func SimpleVolume() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various volume calculation techniques
        let technique = Int.random(in: 0...4)
        var length: Int
        var width: Int
        var height: Int
        var answer: Int
        
        switch technique {
        case 0: // Use numbers that form perfect cubes
            length = Int.random(in: 5...8)
            width = length
            height = length
            answer = length * width * height
            
        case 1: // Use numbers with a common difference
            length = Int.random(in: 8...12)
            width = length - Int.random(in: 1...3)
            height = width - Int.random(in: 1...3)
            answer = length * width * height
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            let base = Int(pow(2.0, Double(power)))
            length = base + Int.random(in: -1...1)
            width = base - Int.random(in: -1...1)
            height = base + Int.random(in: -1...1)
            answer = length * width * height
            
        case 3: // Use numbers that form rectangular prisms with integer diagonals
            length = Int.random(in: 6...8) * 2
            width = Int.random(in: 5...7) * 2
            height = Int.random(in: 4...6) * 2
            answer = length * width * height
            
        case 4: // Use numbers with complementary factors
            length = Int.random(in: 9...12)
            width = length - Int.random(in: 2...4)
            height = width - Int.random(in: 1...3)
            answer = length * width * height
            
        default:
            length = Int.random(in: 5...10)
            width = Int.random(in: 5...10)
            height = Int.random(in: 5...10)
            answer = length * width * height
        }
        
        let question = "Volume of a rectangular prism with length \(length), width \(width), and height \(height) = "
        
        return (question, .integer(answer), asset, 30)
    }
    
    // Problem 31
    func BaseConversion() -> (String, AnswerType, UIImage, Int) {
        let bases = [2, 8, 16] // binary, octal, hexadecimal
        let fromBase = bases.randomElement()!
        var toBase = bases.randomElement()!
        while toBase == fromBase {
            toBase = bases.randomElement()!
        }
        
        let number = Int.random(in: 1...255)
        let answer = number // We'll keep the answer in decimal for simplicity
        
        let question = "Convert \(number) from base \(fromBase) to base \(toBase)"
        
        return (question, .integer(answer), UIImage(resource: .squares), 31)
    }
    
    // Problem 32
    func ComplexFraction() -> (String, Int, UIImage, Int) {
        let whole1 = Int.random(in: 1...5)
        let num1 = Int.random(in: 1...9)
        let den1 = Int.random(in: 2...9)
        let whole2 = Int.random(in: 1...5)
        let num2 = Int.random(in: 1...9)
        let den2 = Int.random(in: 2...9)
        
        let answer = (whole1 * den1 + num1) * (whole2 * den2 + num2) / (den1 * den2)
        let question = "\(whole1) \(num1)/\(den1) × \(whole2) \(num2)/\(den2) = "
        
        return (question, answer, UIImage(resource: .squares), 32)
    }
    
    // Problem 33
    func ScientificNotation() -> (String, Int, UIImage, Int) {
        let num = Double.random(in: 1...9.99)
        let exponent = Int.random(in: -5...5)
        let answer = Int(num * pow(10.0, Double(exponent)))
        let question = String(format: "%.2f × 10^%d = ", num, exponent)
        
        return (question, answer, UIImage(resource: .squares), 33)
    }
    
    // Problem 34
    func Probability() -> (String, Int, UIImage, Int) {
        let total = Int.random(in: 10...50)
        let favorable = Int.random(in: 1...total-1)
        let answer = Int((Double(favorable) / Double(total)) * 100)
        let question = "Probability of selecting \(favorable) out of \(total) = %"
        
        return (question, answer, UIImage(resource: .squares), 34)
    }
    
    // Problem 35
    func Permutations() -> (String, Int, UIImage, Int) {
        let n = Int.random(in: 5...10)
        let r = Int.random(in: 2...4)
        var answer = 1
        for i in 0..<r {
            answer *= (n - i)
        }
        let question = "P(\(n),\(r)) = "
        
        return (question, answer, UIImage(resource: .squares), 35)
    }
    
    // Problem 36
    func ComplexSequence() -> (String, Int, UIImage, Int) {
        let sequenceType = Int.random(in: 0...2)
        let start = Int.random(in: 1...10)
        let n = Int.random(in: 3...6)
        var answer = 0
        var question = ""
        
        switch sequenceType {
        case 0: // Fibonacci-like
            var a = start
            var b = start + 1
            for _ in 0..<n {
                let temp = a + b
                a = b
                b = temp
            }
            answer = b
            question = "Next number in sequence: \(start), \(start+1), ..."
            
        case 1: // Geometric
            let ratio = Int.random(in: 2...5)
            answer = start * Int(pow(Double(ratio), Double(n)))
            question = "Next number in sequence: \(start), \(start*ratio), ..."
            
        case 2: // Arithmetic
            let diff = Int.random(in: 2...5)
            answer = start + (n * diff)
            question = "Next number in sequence: \(start), \(start+diff), ..."
            
        default:
            break
        }
        
        return (question, answer, UIImage(resource: .squares), 36)
    }
    
    // Problem 37
    func ComplexRatio() -> (String, Int, UIImage, Int) {
        let a = Int.random(in: 1...10)
        let b = Int.random(in: 1...10)
        let c = Int.random(in: 1...10)
        let value = Int.random(in: 10...100)
        let answer = (value * b * c) / (a * b)
        let question = "If \(a):\(b):\(c) = \(value):x:\(c), then x = "
        
        return (question, answer, UIImage(resource: .squares), 37)
    }
    
    // Problem 38
    func WeightedAverage() -> (String, Int, UIImage, Int) {
        let count = Int.random(in: 2...4)
        var weights: [Int] = []
        var values: [Int] = []
        var totalWeight = 0
        var weightedSum = 0
        
        for _ in 0..<count {
            let weight = Int.random(in: 1...5)
            let value = Int.random(in: 10...100)
            weights.append(weight)
            values.append(value)
            totalWeight += weight
            weightedSum += weight * value
        }
        
        let answer = weightedSum / totalWeight
        let question = "Weighted average of \(values.map { String($0) }.joined(separator: ", ")) with weights \(weights.map { String($0) }.joined(separator: ", ")) = "
        
        return (question, answer, UIImage(resource: .squares), 38)
    }
    
    // Problem 39
    func CompoundInterest() -> (String, Int, UIImage, Int) {
        let principal = Int.random(in: 100...1000)
        let rate = Double.random(in: 1...10)
        let time = Int.random(in: 1...5)
        let answer = Int(Double(principal) * pow(1 + rate/100, Double(time)))
        let question = "Compound interest on $\(principal) at \(String(format: "%.1f", rate))% for \(time) years = $"
        
        return (question, answer, UIImage(resource: .squares), 39)
    }
    
    // Problem 40
    func ComplexGeometry() -> (String, Int, UIImage, Int) {
        let shapeType = Int.random(in: 0...2)
        var answer = 0
        var question = ""
        
        switch shapeType {
        case 0: // Circle
            let radius = Int.random(in: 2...10)
            answer = Int(Double.pi * Double(radius * radius))
            question = "Area of circle with radius \(radius) = "
            
        case 1: // Triangle
            let base = Int.random(in: 5...15)
            let height = Int.random(in: 5...15)
            answer = (base * height) / 2
            question = "Area of triangle with base \(base) and height \(height) = "
            
        case 2: // Trapezoid
            let a = Int.random(in: 5...15)
            let b = Int.random(in: 5...15)
            let h = Int.random(in: 5...15)
            answer = ((a + b) * h) / 2
            question = "Area of trapezoid with bases \(a) and \(b) and height \(h) = "
            
        default:
            break
        }
        
        return (question, answer, UIImage(resource: .squares), 40)
    }
    
    // Problem 41
    func MixedNumberOperations() -> (String, Int, UIImage, Int) {
        let whole1 = Int.random(in: 1...5)
        let num1 = Int.random(in: 1...9)
        let den1 = Int.random(in: 2...9)
        let whole2 = Int.random(in: 1...5)
        let num2 = Int.random(in: 1...9)
        let den2 = Int.random(in: 2...9)
        
        // Convert to improper fractions
        let improper1 = whole1 * den1 + num1
        let improper2 = whole2 * den2 + num2
        
        // Perform addition
        let answer = (improper1 * den2 + improper2 * den1) / (den1 * den2)
        let question = "\(whole1) \(num1)/\(den1) + \(whole2) \(num2)/\(den2) = "
        
        return (question, answer, UIImage(resource: .squares), 41)
    }
    
    // Problem 42
    func ComplexFractionDivision() -> (String, Int, UIImage, Int) {
        let num1 = Int.random(in: 1...9)
        let den1 = Int.random(in: 2...9)
        let num2 = Int.random(in: 1...9)
        let den2 = Int.random(in: 2...9)
        
        // (a/b) ÷ (c/d) = (a*d)/(b*c)
        let answer = (num1 * den2) / (den1 * num2)
        let question = "(\(num1)/\(den1)) ÷ (\(num2)/\(den2)) = "
        
        return (question, answer, UIImage(resource: .squares), 42)
    }
    
    // Problem 43
    func PercentChange() -> (String, AnswerType, UIImage, Int) {
        let original = Double(Int.random(in: 100...1000))
        let change = Double(Int.random(in: 10...100))
        let isIncrease = Bool.random()
        
        let newValue = isIncrease ? original + change : original - change
        let percentChange = (change / original) * 100.0
        
        let question = "\(Int(original)) \(isIncrease ? "increased" : "decreased") to \(Int(newValue)). Percent \(isIncrease ? "increase" : "decrease")"
        
        return (question, .percent(percentChange), UIImage(resource: .squares), 43)
    }
    
    // Problem 44
    func PrimeFactorization() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        // Generate a number that's a product of small primes
        let primes = [2, 3, 5, 7, 11, 13]
        let numFactors = Int.random(in: 2...4)
        var factors: [Int] = []
        var number = 1
        
        for _ in 0..<numFactors {
            let prime = primes.randomElement()!
            factors.append(prime)
            number *= prime
        }
        
        // Sort factors for consistent display
        factors.sort()
        
        let answer = number
        let question = "Prime factorization of \(number) = \(factors.map { String($0) }.joined(separator: " × "))"
        
        return (question, .integer(answer), asset, 44)
    }
    
    // Problem 45
    func DivisibilityRules() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let rules = [
            (divisor: 2, rule: "even"),
            (divisor: 3, rule: "sum of digits divisible by 3"),
            (divisor: 4, rule: "last two digits divisible by 4"),
            (divisor: 5, rule: "ends in 0 or 5"),
            (divisor: 6, rule: "divisible by both 2 and 3"),
            (divisor: 8, rule: "last three digits divisible by 8"),
            (divisor: 9, rule: "sum of digits divisible by 9"),
            (divisor: 10, rule: "ends in 0")
        ]
        
        let selectedRule = rules.randomElement()!
        let number = Int.random(in: 100...999)
        let isDivisible = number % selectedRule.divisor == 0
        let answer = isDivisible ? 1 : 0
        
        let question = "Is \(number) divisible by \(selectedRule.divisor)? (1 for yes, 0 for no)"
        
        return (question, .integer(answer), asset, 45)
    }
    
    // Problem 46
    func ArithmeticSequences() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let firstTerm = Int.random(in: 1...20)
        let commonDifference = Int.random(in: 1...10)
        let n = Int.random(in: 5...10)
        
        // nth term = a₁ + (n-1)d
        let nthTerm = firstTerm + (n - 1) * commonDifference
        
        // Generate first few terms for display
        var terms: [Int] = []
        for i in 0..<3 {
            terms.append(firstTerm + i * commonDifference)
        }
        
        let question = "Next term in sequence: \(terms.map { String($0) }.joined(separator: ", ")), ..."
        
        return (question, .integer(nthTerm), asset, 46)
    }
    
    // Problem 47
    func CircleProperties() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let radius = Int.random(in: 2...10)
        let propertyType = Int.random(in: 0...2)
        var answer = 0
        var question = ""
        
        switch propertyType {
        case 0: // Area
            answer = Int(Double.pi * Double(radius * radius))
            question = "Area of circle with radius \(radius) = "
            
        case 1: // Circumference
            answer = Int(2 * Double.pi * Double(radius))
            question = "Circumference of circle with radius \(radius) = "
            
        case 2: // Diameter
            answer = 2 * radius
            question = "Diameter of circle with radius \(radius) = "
            
        default:
            break
        }
        
        return (question, .integer(answer), asset, 47)
    }
    
    // Problem 48
    func ComplexExponents() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let base = Int.random(in: 2...5)
        let exponent = Int.random(in: 2...5)
        let answer = Int(pow(Double(base), Double(exponent)))
        let question = "\(base)^\(exponent) = "
        
        return (question, .integer(answer), asset, 48)
    }
    
    // Problem 49
    func BinaryOperations() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let num1 = Int.random(in: 1...15)
        let num2 = Int.random(in: 1...15)
        let operation = Int.random(in: 0...2)
        var answer = 0
        var question = ""
        
        switch operation {
        case 0: // Addition
            answer = num1 + num2
            question = "\(num1) + \(num2) in binary = "
            
        case 1: // Subtraction
            answer = max(num1, num2) - min(num1, num2)
            question = "\(max(num1, num2)) - \(min(num1, num2)) in binary = "
            
        case 2: // Multiplication
            answer = num1 * num2
            question = "\(num1) × \(num2) in binary = "
            
        default:
            break
        }
        
        return (question, .integer(answer), asset, 49)
    }
    
    // Problem 50
    func TimeProblems() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let hours = Int.random(in: 1...12)
        let minutes = Int.random(in: 0...59)
        let addHours = Int.random(in: 1...5)
        let addMinutes = Int.random(in: 0...59)
        
        var totalMinutes = (hours * 60 + minutes) + (addHours * 60 + addMinutes)
        let newHours = (totalMinutes / 60) % 24
        let newMinutes = totalMinutes % 60
        
        let answer = newHours * 100 + newMinutes
        let question = "If it's \(hours):\(String(format: "%02d", minutes)), what time will it be in \(addHours) hours and \(addMinutes) minutes? (Answer in 24-hour format, e.g., 1430 for 2:30 PM)"
        
        return (question, .integer(answer), asset, 50)
    }
    
    // Problem 51
    func FractionComparison() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        // Generate fractions that can be compared using cross-multiplication
        let num1 = Int.random(in: 1...9)
        let den1 = Int.random(in: 2...9)
        let num2 = Int.random(in: 1...9)
        let den2 = Int.random(in: 2...9)
        
        // Ensure fractions are in simplest form
        let gcd1 = GCD(bigger: max(num1, den1), lower: min(num1, den1))
        let gcd2 = GCD(bigger: max(num2, den2), lower: min(num2, den2))
        let simplifiedNum1 = num1 / gcd1
        let simplifiedDen1 = den1 / gcd1
        let simplifiedNum2 = num2 / gcd2
        let simplifiedDen2 = den2 / gcd2
        
        let comparison = simplifiedNum1 * simplifiedDen2 - simplifiedNum2 * simplifiedDen1
        let answer = comparison > 0 ? 1 : (comparison < 0 ? -1 : 0)
        
        let question = "\(simplifiedNum1)/\(simplifiedDen1) ? \(simplifiedNum2)/\(simplifiedDen2)"
        
        return (question, .integer(answer), asset, 51)
    }
    
    // Problem 52
    func PercentIncreaseDecrease() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let technique = Int.random(in: 0...8)
        var base: Int
        var percent: Int
        var isIncrease: Bool
        var newValue: Int
        
        switch technique {
        case 0: // Use numbers where percent is related to base through GCD
            base = Int.random(in: 100...200)
            let gcd = Int.random(in: 2...5)
            percent = base / gcd
            isIncrease = Bool.random()
            newValue = isIncrease ? base + (base * percent / 100) : base - (base * percent / 100)
            
        case 1: // Use numbers where percent is related to base through LCM
            base = Int.random(in: 50...100)
            let factor = Int.random(in: 2...4)
            percent = (base * factor) / 100
            isIncrease = Bool.random()
            newValue = isIncrease ? base + (base * percent / 100) : base - (base * percent / 100)
            
        case 2: // Use numbers where percent is a factor of base
            base = Int.random(in: 120...240)
            let factor = Int.random(in: 2...4)
            percent = base / (factor * 10)
            isIncrease = Bool.random()
            newValue = isIncrease ? base + (base * percent / 100) : base - (base * percent / 100)
            
        case 3: // Use numbers where percent is related to base through prime factors
            let prime = Int.random(in: 2...5)
            base = prime * Int.random(in: 20...40)
            percent = prime * Int.random(in: 10...20)
            isIncrease = Bool.random()
            newValue = isIncrease ? base + (base * percent / 100) : base - (base * percent / 100)
            
        case 4: // Use numbers where percent is a multiple of base's factors
            base = Int.random(in: 80...160)
            let factor = Int.random(in: 2...4)
            percent = (base / factor) / 10
            isIncrease = Bool.random()
            newValue = isIncrease ? base + (base * percent / 100) : base - (base * percent / 100)
            
        case 5: // Use perfect squares (1-30) for percentage
            base = Int.random(in: 100...200)
            let square = Int.random(in: 1...30)
            percent = square * square
            isIncrease = Bool.random()
            newValue = isIncrease ? base + (base * percent / 100) : base - (base * percent / 100)
            
        case 6: // Use perfect cubes (1-30) for percentage
            base = Int.random(in: 100...200)
            let cube = Int.random(in: 1...30)
            percent = cube * cube * cube / 100  // Divide by 100 to keep percentage reasonable
            isIncrease = Bool.random()
            newValue = isIncrease ? base + (base * percent / 100) : base - (base * percent / 100)
            
        case 7: // Use square of a number times a multiplier
            base = Int.random(in: 100...200)
            let num = Int.random(in: 1...15)
            let multiplier = Int.random(in: 2...5)
            percent = (num * num * multiplier)
            isIncrease = Bool.random()
            newValue = isIncrease ? base + (base * percent / 100) : base - (base * percent / 100)
            
        case 8: // Use cube of a number divided by a factor
            base = Int.random(in: 100...200)
            let num = Int.random(in: 1...10)
            let factor = Int.random(in: 2...4)
            percent = (num * num * num) / factor
            isIncrease = Bool.random()
            newValue = isIncrease ? base + (base * percent / 100) : base - (base * percent / 100)
            
        default:
            base = Int.random(in: 100...200)
            percent = Int.random(in: 10...90)
            isIncrease = Bool.random()
            newValue = isIncrease ? base + (base * percent / 100) : base - (base * percent / 100)
        }
        
        let question = "\(base) \(isIncrease ? "+" : "-")\(percent)%"
        
        return (question, .integer(newValue), asset, 52)
    }
    
    // Problem 53
    func NumberOfFactors() -> (String, AnswerType, UIImage, Int) {
        // Generate a number with a known number of factors
        let primes = [2, 3, 5, 7]
        let exponents = [
            Int.random(in: 0...2),
            Int.random(in: 0...2),
            Int.random(in: 0...1),
            Int.random(in: 0...1)
        ]
        
        var number = 1
        for i in 0..<primes.count {
            number *= Int(pow(Double(primes[i]), Double(exponents[i])))
        }
        
        // Calculate number of factors using (e₁+1)(e₂+1)...(eₙ+1)
        var factorCount = 1
        for exponent in exponents {
            factorCount *= (exponent + 1)
        }
        
        let question = "# factors of \(number)"
        
        return (question, .integer(factorCount), UIImage(resource: .squares), 53)
    }
    
    // Problem 54
    func GeometricSequences() -> (String, AnswerType, UIImage, Int) {
        let firstTerm = Int.random(in: 1...5)
        let ratio = Int.random(in: 2...4)
        let n = Int.random(in: 3...5)
        
        let nthTerm = firstTerm * Int(pow(Double(ratio), Double(n-1)))
        
        var sequence: [Int] = []
        var currentTerm = firstTerm
        for _ in 0..<3 {
            sequence.append(currentTerm)
            currentTerm *= ratio
        }
        
        let question = "\(sequence.map { String($0) }.joined(separator: ", ")), ..."
        
        return (question, .integer(nthTerm), UIImage(resource: .squares), 54)
    }
    
    // Problem 55
    func TriangleProperties() -> (String, AnswerType, UIImage, Int) {
        // Generate Pythagorean triple
        let m = Int.random(in: 2...5)
        let n = Int.random(in: 1...m-1)
        let a = m*m - n*n
        let b = 2*m*n
        let c = m*m + n*n
        
        let answer = c
        let question = "Hypotenuse of \(a)-\(b)-\(c) triangle"
        
        return (question, .integer(answer), UIImage(resource: .squares), 55)
    }
    
    // Problem 56
    func ComplexRadicals() -> (String, AnswerType, UIImage, Int) {
        let index = Int.random(in: 2...3)
        let base = Int.random(in: 2...5)
        let radicand = Int(pow(Double(base), Double(index)))
        
        let answer = base
        let question = index == 2 ? "√\(radicand)" : "∛\(radicand)"
        
        return (question, .integer(answer), UIImage(resource: .squares), 56)
    }
    
    // Problem 57
    func RateProblems() -> (String, AnswerType, UIImage, Int) {
        let speed = Int.random(in: 30...70)
        let time = Int.random(in: 1...3)
        let distance = speed * time
        
        let question = "\(distance) mi in \(time) hr = mph"
        
        return (question, .integer(speed), UIImage(resource: .squares), 57)
    }
    
    // Problem 58
    func WorkProblems() -> (String, AnswerType, UIImage, Int) {
        let worker1Time = Int.random(in: 2...4)
        let worker2Time = Int.random(in: 3...6)
        
        // Combined rate = 1/t1 + 1/t2 = (t1 + t2)/(t1*t2)
        // Total time = (t1*t2)/(t1 + t2)
        let totalTime = (worker1Time * worker2Time) / (worker1Time + worker2Time)
        
        let question = "A:\(worker1Time)hr B:\(worker2Time)hr together"
        
        return (question, .integer(totalTime), UIImage(resource: .squares), 58)
    }
    
    // Problem 59
    func DistanceSpeedTime() -> (String, AnswerType, UIImage, Int) {
        let speed = Int.random(in: 40...80)
        let time = Int.random(in: 2...4)
        let distance = speed * time
        
        let question = "\(speed)mph × \(time)hr = mi"
        
        return (question, .integer(distance), UIImage(resource: .squares), 59)
    }
    
    // Problem 60
    func SpecialMultiplicationTricks() -> (String, AnswerType, UIImage, Int) {
        let trickType = Int.random(in: 0...5)
        var num: Int
        var answer: Int
        var question: String
        
        switch trickType {
        case 0: // 11× trick
            num = Int.random(in: 10...99)
            let digits = String(num).map { Int(String($0))! }
            let middleDigit = digits[0] + digits[1]
            let carry = middleDigit / 10
            answer = digits[0] * 100 + (middleDigit % 10) * 10 + digits[1]
            if carry > 0 {
                answer += carry * 100
            }
            question = "\(num) × 11"
            
        case 1: // 101× trick
            num = Int.random(in: 10...99)
            answer = num * 101
            question = "\(num) × 101"
            
        case 2: // 999× trick
            num = Int.random(in: 10...99)
            answer = num * 999
            question = "\(num) × 999"
            
        case 3: // Cross multiply for numbers near 100
            num = Int.random(in: 90...110)
            let diff = num - 100
            answer = (100 + diff) * (100 + diff)
            question = "\(num) × \(num)"
            
        case 4: // Double and half method
            let num1 = Int.random(in: 20...40) * 2
            let num2 = Int.random(in: 20...40) / 2
            answer = num1 * num2 * 2
            question = "\(num1) × \(num2 * 2)"
            
        case 5: // Complement method for numbers near 50
            num = Int.random(in: 45...55)
            let diff = num - 50
            answer = (50 + diff) * (50 + diff)
            question = "\(num) × \(num)"
            
        default:
            num = Int.random(in: 10...99)
            answer = num * 11
            question = "\(num) × 11"
        }
        
        return (question, .integer(answer), UIImage(resource: .squares), 60)
    }
    
    // Problem 61
    func FibonacciSequences() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let start1 = Int.random(in: 1...5)
        let start2 = Int.random(in: 1...5)
        let n = Int.random(in: 3...6)
        
        var a = start1
        var b = start2
        for _ in 0..<n {
            let temp = a + b
            a = b
            b = temp
        }
        
        let question = "Next number in Fibonacci-like sequence: \(start1), \(start2), ..."
        
        return (question, .integer(b), asset, 61)
    }
    
    // Problem 62
    func PatternRecognition() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let patternType = Int.random(in: 0...2)
        var answer = 0
        var question = ""
        
        switch patternType {
        case 0: // Square numbers
            let n = Int.random(in: 5...10)
            answer = n * n
            let sequence = (1...3).map { $0 * $0 }
            question = "Next number in sequence: \(sequence.map { String($0) }.joined(separator: ", ")), ..."
            
        case 1: // Cube numbers
            let n = Int.random(in: 3...6)
            answer = n * n * n
            let sequence = (1...3).map { $0 * $0 * $0 }
            question = "Next number in sequence: \(sequence.map { String($0) }.joined(separator: ", ")), ..."
            
        case 2: // Triangular numbers
            let n = Int.random(in: 4...8)
            answer = (n * (n + 1)) / 2
            let sequence = (1...3).map { ($0 * ($0 + 1)) / 2 }
            question = "Next number in sequence: \(sequence.map { String($0) }.joined(separator: ", ")), ..."
            
        default:
            break
        }
        
        return (question, .integer(answer), asset, 62)
    }
    
    // Problem 63
    func MissingTerms() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let patternType = Int.random(in: 0...2)
        var answer = 0
        var question = ""
        
        switch patternType {
        case 0: // Arithmetic sequence with missing term
            let firstTerm = Int.random(in: 1...10)
            let difference = Int.random(in: 1...5)
            let position = Int.random(in: 2...4)
            answer = firstTerm + (position - 1) * difference
            
            var sequence: [Int] = []
            for i in 0..<5 {
                if i != position - 1 {
                    sequence.append(firstTerm + i * difference)
                } else {
                    sequence.append(-1) // Placeholder for missing term
                }
            }
            
            question = "Missing term in sequence: \(sequence.map { $0 == -1 ? "?" : String($0) }.joined(separator: ", "))"
            
        case 1: // Geometric sequence with missing term
            let firstTerm = Int.random(in: 1...5)
            let ratio = Int.random(in: 2...4)
            let position = Int.random(in: 2...4)
            answer = firstTerm * Int(pow(Double(ratio), Double(position - 1)))
            
            var sequence: [Int] = []
            for i in 0..<5 {
                if i != position - 1 {
                    sequence.append(firstTerm * Int(pow(Double(ratio), Double(i))))
                } else {
                    sequence.append(-1) // Placeholder for missing term
                }
            }
            
            question = "Missing term in sequence: \(sequence.map { $0 == -1 ? "?" : String($0) }.joined(separator: ", "))"
            
        case 2: // Alternating pattern
            let pattern = [Int.random(in: 1...5), Int.random(in: 1...5)]
            let position = Int.random(in: 2...4)
            answer = pattern[position % 2]
            
            var sequence: [Int] = []
            for i in 0..<5 {
                if i != position - 1 {
                    sequence.append(pattern[i % 2])
                } else {
                    sequence.append(-1) // Placeholder for missing term
                }
            }
            
            question = "Missing term in sequence: \(sequence.map { $0 == -1 ? "?" : String($0) }.joined(separator: ", "))"
            
        default:
            break
        }
        
        return (question, .integer(answer), asset, 63)
    }
    
    // Problem 64
    func PythagoreanTheorem() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let a = Int.random(in: 3...8)
        let b = Int.random(in: 3...8)
        let c = Int(sqrt(Double(a*a + b*b)))
        
        let question = "In a right triangle with legs \(a) and \(b), the hypotenuse is"
        
        return (question, .integer(c), asset, 64)
    }
    
    // Problem 65
    func SimilarFigures() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let scaleFactor = Int.random(in: 2...5)
        let dimension = Int.random(in: 5...15)
        let scaledDimension = dimension * scaleFactor
        
        let question = "If a figure is scaled by a factor of \(scaleFactor) and its original dimension is \(dimension), the new dimension is"
        
        return (question, .integer(scaledDimension), asset, 65)
    }
    
    // Problem 66
    func PowerRules() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let base = Int.random(in: 2...5)
        let exponent1 = Int.random(in: 2...4)
        let exponent2 = Int.random(in: 2...4)
        
        // (a^m)^n = a^(m*n)
        let answer = Int(pow(Double(base), Double(exponent1 * exponent2)))
        let question = "(\(base)^\(exponent1))^\(exponent2) = "
        
        return (question, .integer(answer), asset, 66)
    }
    
    // Problem 67
    func OctalOperations() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let num1 = Int.random(in: 1...15)
        let num2 = Int.random(in: 1...15)
        let operation = Int.random(in: 0...2)
        var answer = 0
        var question = ""
        
        // Convert decimal numbers to octal strings
        let octal1 = String(num1, radix: 8)
        let octal2 = String(num2, radix: 8)
        
        switch operation {
        case 0: // Addition
            answer = num1 + num2
            question = "\(octal1)₈ + \(octal2)₈ = (answer in decimal)"
            
        case 1: // Subtraction
            answer = max(num1, num2) - min(num1, num2)
            question = "\(String(max(num1, num2), radix: 8))₈ - \(String(min(num1, num2), radix: 8))₈ = (answer in decimal)"
            
        case 2: // Multiplication
            answer = num1 * num2
            question = "\(octal1)₈ × \(octal2)₈ = (answer in decimal)"
            
        default:
            break
        }
        
        return (question, .integer(answer), asset, 67)
    }
    
    // Problem 68
    func HexadecimalOperations() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let num1 = Int.random(in: 1...15)
        let num2 = Int.random(in: 1...15)
        let operation = Int.random(in: 0...2)
        var answer = 0
        var question = ""
        
        // Convert decimal numbers to hexadecimal strings
        let hex1 = String(num1, radix: 16).uppercased()
        let hex2 = String(num2, radix: 16).uppercased()
        
        switch operation {
        case 0: // Addition
            answer = num1 + num2
            question = "\(hex1)₁₆ + \(hex2)₁₆ = (answer in decimal)"
            
        case 1: // Subtraction
            answer = max(num1, num2) - min(num1, num2)
            question = "\(String(max(num1, num2), radix: 16).uppercased())₁₆ - \(String(min(num1, num2), radix: 16).uppercased())₁₆ = (answer in decimal)"
            
        case 2: // Multiplication
            answer = num1 * num2
            question = "\(hex1)₁₆ × \(hex2)₁₆ = (answer in decimal)"
            
        default:
            break
        }
        
        return (question, .integer(answer), asset, 68)
    }
    
    // Problem 69
    func BaseAdditionSubtraction() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various surface area calculation techniques
        let technique = Int.random(in: 0...4)
        var length: Int
        var width: Int
        var height: Int
        var answer: Int
        
        switch technique {
        case 0: // Use numbers that form perfect cubes
            length = Int.random(in: 5...8)
            width = length
            height = length
            answer = 2 * (length * width + width * height + height * length)
            
        case 1: // Use numbers with a common difference
            length = Int.random(in: 8...12)
            width = length - Int.random(in: 1...3)
            height = width - Int.random(in: 1...3)
            answer = 2 * (length * width + width * height + height * length)
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            let base = Int(pow(2.0, Double(power)))
            length = base + Int.random(in: -1...1)
            width = base - Int.random(in: -1...1)
            height = base + Int.random(in: -1...1)
            answer = 2 * (length * width + width * height + height * length)
            
        case 3: // Use numbers that form rectangular prisms with integer diagonals
            length = Int.random(in: 6...8) * 2
            width = Int.random(in: 5...7) * 2
            height = Int.random(in: 4...6) * 2
            answer = 2 * (length * width + width * height + height * length)
            
        case 4: // Use numbers with complementary factors
            length = Int.random(in: 9...12)
            width = length - Int.random(in: 2...4)
            height = width - Int.random(in: 1...3)
            answer = 2 * (length * width + width * height + height * length)
            
        default:
            length = Int.random(in: 5...10)
            width = Int.random(in: 5...10)
            height = Int.random(in: 5...10)
            answer = 2 * (length * width + width * height + height * length)
        }
        
        let question = "Surface area of a rectangular prism with length \(length), width \(width), and height \(height) = "
        
        return (question, .integer(answer), asset, 31)
    }
    
    // Problem 32
    func SimpleCircumference() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various circumference calculation techniques
        let technique = Int.random(in: 0...4)
        var radius: Int
        var answer: Double
        
        switch technique {
        case 0: // Use numbers that form perfect circles
            radius = Int.random(in: 5...10)
            answer = 2 * Double.pi * Double(radius)
            
        case 1: // Use numbers with a common difference
            radius = Int.random(in: 8...12)
            answer = 2 * Double.pi * Double(radius)
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            let base = Int(pow(2.0, Double(power)))
            radius = base + Int.random(in: -1...1)
            answer = 2 * Double.pi * Double(radius)
            
        case 3: // Use numbers that form circles with integer diameters
            radius = Int.random(in: 6...8) * 2
            answer = 2 * Double.pi * Double(radius)
            
        case 4: // Use numbers with complementary factors
            radius = Int.random(in: 9...12)
            answer = 2 * Double.pi * Double(radius)
            
        default:
            radius = Int.random(in: 5...10)
            answer = 2 * Double.pi * Double(radius)
        }
        
        let question = "Circumference of a circle with radius \(radius) = "
        
        return (question, .approximation(answer, 0.1), asset, 32)
    }
    
    // Problem 33
    func SimpleAreaCircle() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various circle area calculation techniques
        let technique = Int.random(in: 0...4)
        var radius: Int
        var answer: Double
        
        switch technique {
        case 0: // Use numbers that form perfect circles
            radius = Int.random(in: 5...10)
            answer = Double.pi * Double(radius * radius)
            
        case 1: // Use numbers with a common difference
            radius = Int.random(in: 8...12)
            answer = Double.pi * Double(radius * radius)
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            let base = Int(pow(2.0, Double(power)))
            radius = base + Int.random(in: -1...1)
            answer = Double.pi * Double(radius * radius)
            
        case 3: // Use numbers that form circles with integer diameters
            radius = Int.random(in: 6...8) * 2
            answer = Double.pi * Double(radius * radius)
            
        case 4: // Use numbers with complementary factors
            radius = Int.random(in: 9...12)
            answer = Double.pi * Double(radius * radius)
            
        default:
            radius = Int.random(in: 5...10)
            answer = Double.pi * Double(radius * radius)
        }
        
        let question = "Area of a circle with radius \(radius) = "
        
        return (question, .approximation(answer, 0.1), asset, 33)
    }
    
    // Problem 34
    func SimpleAreaTriangle() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various triangle area calculation techniques
        let technique = Int.random(in: 0...4)
        var base: Int
        var height: Int
        var answer: Double
        
        switch technique {
        case 0: // Use numbers that form right triangles
            base = Int.random(in: 6...10)
            height = Int.random(in: 6...10)
            answer = 0.5 * Double(base * height)
            
        case 1: // Use numbers with a common difference
            base = Int.random(in: 8...12)
            height = base - Int.random(in: 1...3)
            answer = 0.5 * Double(base * height)
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            let baseValue = Int(pow(2.0, Double(power)))
            base = baseValue + Int.random(in: -1...1)
            height = baseValue - Int.random(in: -1...1)
            answer = 0.5 * Double(base * height)
            
        case 3: // Use numbers that form triangles with integer heights
            base = Int.random(in: 6...8) * 2
            height = Int.random(in: 5...7) * 2
            answer = 0.5 * Double(base * height)
            
        case 4: // Use numbers with complementary factors
            base = Int.random(in: 9...12)
            height = base - Int.random(in: 2...4)
            answer = 0.5 * Double(base * height)
            
        default:
            base = Int.random(in: 5...10)
            height = Int.random(in: 5...10)
            answer = 0.5 * Double(base * height)
        }
        
        let question = "Area of a triangle with base \(base) and height \(height) = "
        
        return (question, .approximation(answer, 0.1), asset, 34)
    }
    
    // Problem 35
    func SimpleAreaParallelogram() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various parallelogram area calculation techniques
        let technique = Int.random(in: 0...4)
        var base: Double
        var height: Double
        var answer: Double
        
        switch technique {
        case 0: // Use numbers that form regular parallelograms
            base = Double(Int.random(in: 6...10))
            height = Double(Int.random(in: 6...10))
            answer = base * height
            
        case 1: // Use numbers with a common difference
            base = Double(Int.random(in: 8...12))
            height = base - Double(Int.random(in: 1...3))
            answer = base * height
            
        case 2: // Use numbers near powers of 2
            let power = Double(Int.random(in: 3...4))
            let baseValue = Double(Int(pow(2.0, Double(power))))
            base = baseValue + Double(Int.random(in: -1...1))
            height = baseValue - Double(Int.random(in: -1...1))
            answer = base * height
            
        case 3: // Use numbers that form parallelograms with integer heights
            base = Double(Int.random(in: 6...8) * 2)
            height = Double(Int.random(in: 5...7) * 2)
            answer = 0.5 * Double(base * height)
            
        case 4: // Use numbers with complementary factors
            base = Double(Int.random(in: 9...12))
            height = base - Double(Int.random(in: 2...4))
            answer = 0.5 * Double(base * height)
            
        default:
            base = Double(Int.random(in: 5...10))
            height = Double(Int.random(in: 5...10))
            answer = 0.5 * Double(base * height)
        }
        
        let question = "Area of a triangle with base \(base) and height \(height) = "
        
        return (question, .approximation(answer, 0.1), asset, 34)
    }
    
    // Problem 37
    func SimpleAreaRhombus() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various rhombus area calculation techniques
        let technique = Int.random(in: 0...4)
        var diagonal1: Int
        var diagonal2: Int
        var answer: Double
        
        switch technique {
        case 0: // Use numbers that form regular rhombuses
            diagonal1 = Int.random(in: 8...12)
            diagonal2 = Int.random(in: 6...10)
            answer = 0.5 * Double(diagonal1 * diagonal2)
            
        case 1: // Use numbers with a common difference
            diagonal1 = Int.random(in: 10...15)
            diagonal2 = diagonal1 - Int.random(in: 2...4)
            answer = 0.5 * Double(diagonal1 * diagonal2)
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            let baseValue = Int(pow(2.0, Double(power)))
            diagonal1 = baseValue + Int.random(in: -1...1)
            diagonal2 = baseValue - Int.random(in: -1...1)
            answer = 0.5 * Double(diagonal1 * diagonal2)
            
        case 3: // Use numbers that form rhombuses with integer diagonals
            diagonal1 = Int.random(in: 6...8) * 2
            diagonal2 = Int.random(in: 4...6) * 2
            answer = 0.5 * Double(diagonal1 * diagonal2)
            
        case 4: // Use numbers with complementary factors
            diagonal1 = Int.random(in: 12...16)
            diagonal2 = diagonal1 - Int.random(in: 4...6)
            answer = 0.5 * Double(diagonal1 * diagonal2)
            
        default:
            diagonal1 = Int.random(in: 8...12)
            diagonal2 = Int.random(in: 6...10)
            answer = 0.5 * Double(diagonal1 * diagonal2)
        }
        
        let question = "Area of a rhombus with diagonals \(diagonal1) and \(diagonal2) = "
        
        return (question, .approximation(answer, 0.1), asset, 37)
    }
    
    // Problem 38
    func SimpleAreaKite() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various kite area calculation techniques
        let technique = Int.random(in: 0...4)
        var diagonal1: Int
        var diagonal2: Int
        var answer: Double
        
        switch technique {
        case 0: // Use numbers that form regular kites
            diagonal1 = Int.random(in: 8...12)
            diagonal2 = Int.random(in: 6...10)
            answer = 0.5 * Double(diagonal1 * diagonal2)
            
        case 1: // Use numbers with a common difference
            diagonal1 = Int.random(in: 10...15)
            diagonal2 = diagonal1 - Int.random(in: 2...4)
            answer = 0.5 * Double(diagonal1 * diagonal2)
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            let baseValue = Int(pow(2.0, Double(power)))
            diagonal1 = baseValue + Int.random(in: -1...1)
            diagonal2 = baseValue - Int.random(in: -1...1)
            answer = 0.5 * Double(diagonal1 * diagonal2)
            
        case 3: // Use numbers that form kites with integer diagonals
            diagonal1 = Int.random(in: 6...8) * 2
            diagonal2 = Int.random(in: 4...6) * 2
            answer = 0.5 * Double(diagonal1 * diagonal2)
            
        case 4: // Use numbers with complementary factors
            diagonal1 = Int.random(in: 12...16)
            diagonal2 = diagonal1 - Int.random(in: 4...6)
            answer = 0.5 * Double(diagonal1 * diagonal2)
            
        default:
            diagonal1 = Int.random(in: 8...12)
            diagonal2 = Int.random(in: 6...10)
            answer = 0.5 * Double(diagonal1 * diagonal2)
        }
        
        let question = "Area of a kite with diagonals \(diagonal1) and \(diagonal2) = "
        
        return (question, .approximation(answer, 0.1), asset, 38)
    }
    
    // Problem 39
    func SimpleAreaRegularPolygon() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various regular polygon area calculation techniques
        let technique = Int.random(in: 0...4)
        var sides: Int
        var sideLength: Int
        var apothem: Double
        var answer: Double
        
        switch technique {
        case 0: // Use regular hexagons
            sides = 6
            sideLength = Int.random(in: 4...8)
            apothem = Double(sideLength) * sqrt(3) / 2
            answer = 0.5 * Double(sides * sideLength) * apothem
            
        case 1: // Use regular pentagons
            sides = 5
            sideLength = Int.random(in: 4...8)
            apothem = Double(sideLength) * 0.688 // Approximate apothem for pentagon
            answer = 0.5 * Double(sides * sideLength) * apothem
            
        case 2: // Use regular octagons
            sides = 8
            sideLength = Int.random(in: 4...8)
            apothem = Double(sideLength) * 1.207 // Approximate apothem for octagon
            answer = 0.5 * Double(sides * sideLength) * apothem
            
        case 3: // Use regular squares (for comparison)
            sides = 4
            sideLength = Int.random(in: 6...10)
            apothem = Double(sideLength) / 2
            answer = 0.5 * Double(sides * sideLength) * apothem
            
        case 4: // Use regular triangles (for comparison)
            sides = 3
            sideLength = Int.random(in: 8...12)
            apothem = Double(sideLength) * sqrt(3) / 6
            answer = 0.5 * Double(sides * sideLength) * apothem
            
        default:
            sides = 6
            sideLength = Int.random(in: 4...8)
            apothem = Double(sideLength) * sqrt(3) / 2
            answer = 0.5 * Double(sides * sideLength) * apothem
        }
        
        let question = "Area of a regular \(polygonName(sides)) with side length \(sideLength) = "
        
        return (question, .approximation(answer, 0.1), asset, 39)
    }
    
    private func polygonName(_ sides: Int) -> String {
        switch sides {
        case 3: return "triangle"
        case 4: return "square"
        case 5: return "pentagon"
        case 6: return "hexagon"
        case 8: return "octagon"
        default: return "polygon"
        }
    }
    
    // Problem 40
    func SimpleAreaSector() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various sector area calculation techniques
        let technique = Int.random(in: 0...4)
        var radius: Int
        var angle: Int
        var answer: Double
        
        switch technique {
        case 0: // Use common angles (90°, 180°, etc.)
            radius = Int.random(in: 5...10)
            angle = [90, 180, 270, 360].randomElement()!
            answer = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            
        case 1: // Use angles that are factors of 360
            radius = Int.random(in: 6...12)
            angle = [45, 60, 120, 240].randomElement()!
            answer = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            radius = Int(pow(2.0, Double(power))) + Int.random(in: -1...1)
            angle = [72, 144, 216, 288].randomElement()!
            answer = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            
        case 3: // Use angles that form simple fractions of a circle
            radius = Int.random(in: 8...15)
            angle = [30, 45, 60, 120].randomElement()!
            answer = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            
        case 4: // Use complementary angles
            radius = Int.random(in: 7...14)
            angle = [36, 72, 108, 144].randomElement()!
            answer = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            
        default:
            radius = Int.random(in: 5...10)
            angle = [90, 180, 270, 360].randomElement()!
            answer = Double.pi * Double(radius * radius) * Double(angle) / 360.0
        }
        
        let question = "Area of a sector with radius \(radius) and central angle \(angle)° = "
        
        return (question, .approximation(answer, 0.1), asset, 40)
    }
    
    // Problem 41
    func SimpleAreaSegment() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various segment area calculation techniques
        let technique = Int.random(in: 0...4)
        var radius: Int
        var angle: Int
        var answer: Double
        
        switch technique {
        case 0: // Use common angles (90°, 180°, etc.)
            radius = Int.random(in: 5...10)
            angle = [90, 180, 270, 360].randomElement()!
            let sectorArea = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            let triangleArea = Double(radius * radius) * sin(Double(angle) * Double.pi / 180.0) / 2.0
            answer = sectorArea - triangleArea
            
        case 1: // Use angles that are factors of 360
            radius = Int.random(in: 6...12)
            angle = [45, 60, 120, 240].randomElement()!
            let sectorArea = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            let triangleArea = Double(radius * radius) * sin(Double(angle) * Double.pi / 180.0) / 2.0
            answer = sectorArea - triangleArea
            
        case 2: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            radius = Int(pow(2.0, Double(power))) + Int.random(in: -1...1)
            angle = [72, 144, 216, 288].randomElement()!
            let sectorArea = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            let triangleArea = Double(radius * radius) * sin(Double(angle) * Double.pi / 180.0) / 2.0
            answer = sectorArea - triangleArea
            
        case 3: // Use angles that form simple fractions of a circle
            radius = Int.random(in: 8...15)
            angle = [30, 45, 60, 120].randomElement()!
            let sectorArea = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            let triangleArea = Double(radius * radius) * sin(Double(angle) * Double.pi / 180.0) / 2.0
            answer = sectorArea - triangleArea
            
        case 4: // Use complementary angles
            radius = Int.random(in: 7...14)
            angle = [36, 72, 108, 144].randomElement()!
            let sectorArea = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            let triangleArea = Double(radius * radius) * sin(Double(angle) * Double.pi / 180.0) / 2.0
            answer = sectorArea - triangleArea
            
        default:
            radius = Int.random(in: 5...10)
            angle = [90, 180, 270, 360].randomElement()!
            let sectorArea = Double.pi * Double(radius * radius) * Double(angle) / 360.0
            let triangleArea = Double(radius * radius) * sin(Double(angle) * Double.pi / 180.0) / 2.0
            answer = sectorArea - triangleArea
        }
        
        let question = "Area of a segment with radius \(radius) and central angle \(angle)° = "
        
        return (question, .approximation(answer, 0.1), asset, 41)
    }
    
    // Problem 42
    func SimpleAreaAnnulus() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various annulus area calculation techniques
        let technique = Int.random(in: 0...4)
        var outerRadius: Int
        var innerRadius: Int
        var answer: Double
        
        switch technique {
        case 0: // Use concentric circles with common difference
            outerRadius = Int.random(in: 8...12)
            innerRadius = outerRadius - Int.random(in: 2...4)
            answer = Double.pi * Double(outerRadius * outerRadius - innerRadius * innerRadius)
            
        case 1: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            let base = Int(pow(2.0, Double(power)))
            outerRadius = base + Int.random(in: -1...1)
            innerRadius = base - Int.random(in: 2...4)
            answer = Double.pi * Double(outerRadius * outerRadius - innerRadius * innerRadius)
            
        case 2: // Use numbers that form perfect squares
            outerRadius = Int.random(in: 6...8) * 2
            innerRadius = Int.random(in: 4...6) * 2
            answer = Double.pi * Double(outerRadius * outerRadius - innerRadius * innerRadius)
            
        case 3: // Use numbers with complementary factors
            outerRadius = Int.random(in: 10...15)
            innerRadius = outerRadius - Int.random(in: 3...6)
            answer = Double.pi * Double(outerRadius * outerRadius - innerRadius * innerRadius)
            
        case 4: // Use numbers that form patterns
            outerRadius = Int.random(in: 7...10) * 2
            innerRadius = outerRadius / 2
            answer = Double.pi * Double(outerRadius * outerRadius - innerRadius * innerRadius)
            
        default:
            outerRadius = Int.random(in: 8...12)
            innerRadius = outerRadius - Int.random(in: 2...4)
            answer = Double.pi * Double(outerRadius * outerRadius - innerRadius * innerRadius)
        }
        
        let question = "Area of an annulus with outer radius \(outerRadius) and inner radius \(innerRadius) = "
        
        return (question, .approximation(answer, 0.1), asset, 42)
    }
    
    // Problem 43
    func SimpleAreaEllipse() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        
        // Generate numbers that demonstrate various ellipse area calculation techniques
        let technique = Int.random(in: 0...4)
        var majorAxis: Int
        var minorAxis: Int
        var answer: Double
        
        switch technique {
        case 0: // Use numbers that form perfect squares
            majorAxis = Int.random(in: 6...8) * 2
            minorAxis = Int.random(in: 4...6) * 2
            answer = Double.pi * Double(majorAxis * minorAxis) / 4.0
            
        case 1: // Use numbers near powers of 2
            let power = Int.random(in: 3...4)
            let base = Int(pow(2.0, Double(power)))
            majorAxis = base + Int.random(in: -1...1)
            minorAxis = base - Int.random(in: 2...4)
            answer = Double.pi * Double(majorAxis * minorAxis) / 4.0
            
        case 2: // Use numbers with common difference
            majorAxis = Int.random(in: 10...15)
            minorAxis = majorAxis - Int.random(in: 3...6)
            answer = Double.pi * Double(majorAxis * minorAxis) / 4.0
            
        case 3: // Use numbers that form patterns
            majorAxis = Int.random(in: 8...12) * 2
            minorAxis = majorAxis / 2
            answer = Double.pi * Double(majorAxis * minorAxis) / 4.0
            
        case 4: // Use numbers with complementary factors
            majorAxis = Int.random(in: 12...18)
            minorAxis = majorAxis - Int.random(in: 4...8)
            answer = Double.pi * Double(majorAxis * minorAxis) / 4.0
            
        default:
            majorAxis = Int.random(in: 8...12)
            minorAxis = Int.random(in: 6...10)
            answer = Double.pi * Double(majorAxis * minorAxis) / 4.0
        }
        
        let question = "Area of an ellipse with major axis \(majorAxis) and minor axis \(minorAxis) = "
        
        return (question, .approximation(answer, 0.1), asset, 43)
    }
    
    // Problem 44
    func PrimeFactorization() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        // Generate a number that's a product of small primes
        let primes = [2, 3, 5, 7, 11, 13]
        let numFactors = Int.random(in: 2...4)
        var factors: [Int] = []
        var number = 1
        
        for _ in 0..<numFactors {
            let prime = primes.randomElement()!
            factors.append(prime)
            number *= prime
        }
        
        // Sort factors for consistent display
        factors.sort()
        
        let answer = number
        let question = "Prime factorization of \(number) = \(factors.map { String($0) }.joined(separator: " × "))"
        
        return (question, .integer(answer), asset, 44)
    }
    
    // Problem 45
    func DivisibilityRules() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let rules = [
            (divisor: 2, rule: "even"),
            (divisor: 3, rule: "sum of digits divisible by 3"),
            (divisor: 4, rule: "last two digits divisible by 4"),
            (divisor: 5, rule: "ends in 0 or 5"),
            (divisor: 6, rule: "divisible by both 2 and 3"),
            (divisor: 8, rule: "last three digits divisible by 8"),
            (divisor: 9, rule: "sum of digits divisible by 9"),
            (divisor: 10, rule: "ends in 0")
        ]
        
        let selectedRule = rules.randomElement()!
        let number = Int.random(in: 100...999)
        let isDivisible = number % selectedRule.divisor == 0
        let answer = isDivisible ? 1 : 0
        
        let question = "Is \(number) divisible by \(selectedRule.divisor)? (1 for yes, 0 for no)"
        
        return (question, .integer(answer), asset, 45)
    }
    
    // Problem 46
    func ArithmeticSequences() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let firstTerm = Int.random(in: 1...20)
        let commonDifference = Int.random(in: 1...10)
        let n = Int.random(in: 5...10)
        
        // nth term = a₁ + (n-1)d
        let nthTerm = firstTerm + (n - 1) * commonDifference
        
        // Generate first few terms for display
        var terms: [Int] = []
        for i in 0..<3 {
            terms.append(firstTerm + i * commonDifference)
        }
        
        let question = "Next term in sequence: \(terms.map { String($0) }.joined(separator: ", ")), ..."
        
        return (question, .integer(nthTerm), asset, 46)
    }
    
    // Problem 78
    func SpecialAdditionSubtractionTricks() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let trickType = Int.random(in: 0...2)
        var answer = 0
        var question = ""
        
        switch trickType {
        case 0: // Add 99
            let num = Int.random(in: 100...900)
            answer = num + 99
            question = "\(num) + 99 = "
            
        case 1: // Subtract 99
            let num = Int.random(in: 100...900)
            answer = num - 99
            question = "\(num) - 99 = "
            
        case 2: // Add 101
            let num = Int.random(in: 100...900)
            answer = num + 101
            question = "\(num) + 101 = "
            
        default:
            break
        }
        
        return (question, .integer(answer), asset, 78)
    }
    
    // Problem 79
    func SumOfFactors() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        // Generate a number with a known sum of factors
        let primes = [2, 3, 5]
        let exponents = [Int.random(in: 0...2), Int.random(in: 0...2), Int.random(in: 0...2)]
        
        var number = 1
        for i in 0..<primes.count {
            number *= Int(pow(Double(primes[i]), Double(exponents[i])))
        }
        
        // Calculate sum of factors
        var sum = 1
        for i in 0..<primes.count {
            let p = primes[i]
            let e = exponents[i]
            var term = 1
            for j in 0...e {
                term += Int(pow(Double(p), Double(j)))
            }
            sum *= term
        }
        
        let question = "Sum of all factors of \(number) = "
        
        return (question, .integer(sum), asset, 79)
    }
    
    // Problem 80
    func PerfectNumbers() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        // The first few perfect numbers are 6, 28, 496, 8128
        let perfectNumbers = [6, 28, 496, 8128]
        let number = perfectNumbers.randomElement()!
        
        // Sum of proper divisors of a perfect number equals the number itself
        let question = "Is \(number) a perfect number? (Enter the number if yes, 0 if no)"
        
        return (question, .integer(number), asset, 80)
    }
    
    // Problem 81: Approximation problems marked with asterisk in UIL tests
    func ApproximationV2() -> (String, AnswerType, UIImage, Int) {
        let asset = UIImage(resource: .squares)
        let problemType = Int.random(in: 0...3)
        var exactAnswer: Double = 0
        var question = ""
        
        switch problemType {
        case 0: // Square root approximation
            // Choose a number near a perfect square for easy approximation
            let base = Int.random(in: 10...20)
            let offset = Int.random(in: -5...5)
            let number = base * base + offset
            exactAnswer = sqrt(Double(number))
            question = "√\(number)*"
            
*/
