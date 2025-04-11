//
//  Problems.swift
//  rest
//
//  Created by kalsky_953982 on 2/12/25.
//
import Swift
import Foundation
import SwiftUI

//Problem 1
///this is always an addition/subtraction string of numbers 2-4 digits
///returns (problem string, answer int, help image, questionID)
func IntegerSimplification()-> (String, Int, UIImage, Int){
    let asset = UIImage(resource: .intSimplification)
    var answer = 0
    var num1 = 0
    var num2 = 0
    var num3 = 0
    
    //will go 12 times (4 for each number)
    //first it will add the LSD of each number, then it will add more significant digits
    //if b = true, it will skip a digit, making the number smaller
    for i in 0...11 {
        let b = Bool.random()//skip digit?
        let b1 = Bool.random()//less likely
        let b2 = Bool.random()//less likely
        
        if !b || !b1 || !b2 {
            let d = Int.random(in: 0..<10)
            let neg = Bool.random()
            
            switch i%3{
                
            case 0:
                num1 += d * Int(powf(10, Float(i/3)))
                num1 *= neg ? -1 : 1
                
            case 1:
                num2 += d * Int(powf(10, Float(i/3)))
                num2 *= neg ? -1 : 1
            case 2:
                num3 += d * Int(powf(10, Float(i/3)))
                num3 *= neg ? -1 : 1
                
            default:
                break
            }
        }
        
        
    }

    answer = num1 + num2 + num3
    let answerString = String(format: "%d %+d %+d = ", num1, num2, num3)
    
    
    
    return (answerString, answer, asset, 1)
}

//Problem 2
//Remainder
//random dividor from 3-11
//random 5 digit number
func RemainderQuestion() -> (String, Int, UIImage, Int){
    let asset = UIImage(resource: .remainders)
    var base = Int.random(in: 3...11)
    while base == 10 || base == 5{
        base = Int.random(in: 3...11)
    }
    var num = 0
    for i in 1...6 {
        num += Int.random(in: 0...9)*Int(powl(10, Double(i)))
    }
    let question = "\(num) / \(base) has a remainder of"
    let answer = num % base
    
    return (question, answer, asset, 2)
}

//Problem 3
//Convert a Roman Numeral Equation into an arabic numeral answer
func RomanNumerals()->(String, Int, UIImage, Int){
    let ROMAN_NUMERALS = ["I", "V", "X", "L", "C", "D", "M"]
    let VALUES = [1, 5, 10, 50, 100, 500, 1000]
    
    // Generate random numbers
    var num1Arabic = Int.random(in: -3999..<4000)
    var num2Arabic = Int.random(in: -3999..<4000)
    var answerArabic = num1Arabic + num2Arabic
    
    // Maximum attempts to avoid infinite recursion
    let maxAttempts = 10
    var attempts = 0
    
    func convertToRoman(_ num: Int) -> String {
        var n = abs(num)
        var result = ""
        
        // Handle thousands
        while n >= 1000 {
            result += "M"
            n -= 1000
        }
        
        // Handle hundreds
        if n >= 900 {
            result += "CM"
            n -= 900
        } else if n >= 500 {
            result += "D"
            n -= 500
        } else if n >= 400 {
            result += "CD"
            n -= 400
        }
        while n >= 100 {
            result += "C"
            n -= 100
        }
        
        // Handle tens
        if n >= 90 {
            result += "XC"
            n -= 90
        } else if n >= 50 {
            result += "L"
            n -= 50
        } else if n >= 40 {
            result += "XL"
            n -= 40
        }
        while n >= 10 {
            result += "X"
            n -= 10
        }
        
        // Handle ones
        if n >= 9 {
            result += "IX"
            n -= 9
        } else if n >= 5 {
            result += "V"
            n -= 5
        } else if n >= 4 {
            result += "IV"
            n -= 4
        }
        while n > 0 {
            result += "I"
            n -= 1
        }
        
        return result
    }
    
    func isValidRomanNumeral(_ roman: String) -> Bool {
        // Check for invalid combinations
        let invalidCombinations = [
            "IIII", "VV", "XXXX", "LL", "CCCC", "DD", "MMMM",
            "IL", "IC", "ID", "IM", "VL", "VC", "VD", "VM",
            "XD", "XM", "LD", "LM", "DM"
        ]
        
        for invalid in invalidCombinations {
            if roman.contains(invalid) {
                return false
            }
        }
        
        // Check for proper subtractive notation
        // Only I can be used before V and X
        // Only X can be used before L and C
        // Only C can be used before D and M
        let validSubtractive = [
            "IV", "IX", "XL", "XC", "CD", "CM"
        ]
        
        // Count occurrences of each valid subtractive combination
        for subtractive in validSubtractive {
            let count = roman.components(separatedBy: subtractive).count - 1
            if count > 1 {
                return false // Each subtractive combination should appear at most once
            }
        }
        
        return true
    }
    
    // Generate valid Roman numerals
    var question1 = ""
    var question2 = ""
    
    repeat {
        question1 = convertToRoman(num1Arabic)
        attempts += 1
    } while !isValidRomanNumeral(question1) && attempts < maxAttempts
    
    attempts = 0
    repeat {
        question2 = convertToRoman(num2Arabic)
        attempts += 1
    } while !isValidRomanNumeral(question2) && attempts < maxAttempts
    
    // If we couldn't generate valid Roman numerals after max attempts, try with new random numbers
    if !isValidRomanNumeral(question1) || !isValidRomanNumeral(question2) {
        return RomanNumerals() // Recursive call with new random numbers
    }
    
    let question = "In Arabic Numerals: " + ((num1Arabic<0) ? "-" : "") + question1 + " + " + ((num2Arabic<0) ? "-" : "") + question2 + " = "
    
    return (question, answerArabic, UIImage(resource: .romanNumerals), 3)
}

//Problem 4
func TwoXtwo()->(String, Int, UIImage, Int){
    
    let num1 = Int.random(in: 11...101)
    var num2 = Int.random(in: 11...101)
    while num1 == num2 {
        num2 = Int.random(in: 11...101)
    }
    let answer = num1 * num2
    let question = "\(num1) x \(num2) = "
    
    return (question, answer, UIImage(resource: .twoXTwos), 4)
}

//Problem 5
func OneHundreds()->(String, Int, UIImage, Int){
    
    let num1 = Int.random(in: 90...110)
    var num2 = Int.random(in: 90...110)
    while num1 == num2 {
        num2 = Int.random(in: 90...110)
    }
    let answer = num1 * num2
    let question = "\(num1) x \(num2) = "
    
    return (question, answer, UIImage(resource: .nearHundred), 5)
}

//Problem 6
func Squares()->(String, Int, UIImage, Int){
    
    let base = Int.random(in: 15...30)
    let answer = base*base
    let question = "\(base)\u{00B2} = "
    
    return (question, answer, UIImage(resource: .squares), 5)
}

//Problem 7
func Cubes()->(String, Int, UIImage, Int){
    
    let base = Int.random(in: 15...30)
    let answer = base*base*base
    let question = "\(base)\u{00B3} = "
    
    
    return (question, answer, UIImage(resource: .cubes), 5)
}

//Problem 8
//(a(a+1) - b(b+1)) * 100
func DifferenceOfSquaresEndingIn5()->(String, Int, UIImage, Int){
    let a = Int.random(in: 1...9) * 10 + 5
    var b = Int.random(in: 1...9) * 10 + 5
    while a == b {
        b = Int.random(in: 11...101)
    }
    let answer = a*a - b*b
    
    let question = "\(a)\u{00B2} - \(b)\u{00B2} = "
    
    return (question, answer, UIImage(resource: .differenceOfSquaresEndingIn5), 8)
}

//Problem 9
//(25+(a-50))*100 + (a-50)^2
func AboveAndUnder50Squared()->(String, Int, UIImage, Int){
    let a = Int.random(in: 40...60)
    let answer = a*a
    
    let question = "\(a)\u{00B2} = "
    
    return (question, answer, UIImage(resource: .squaresNear50), 9)
}

//Problem 10
func LCM()->(String, Int, UIImage, Int){
    let a = Int(powl(2, Double(Int.random(in: 0...3))) * powl(3, Double(Int.random(in: 0...3))) * powl(5, Double(Int.random(in: 0...2))))
    var b = Int(powl(2, Double(Int.random(in: 0...3))) * powl(3, Double(Int.random(in: 0...3))) * powl(5, Double(Int.random(in: 0...2))))
    while b == a || (a%b == 0 || b%a == 0){
        b = Int(powl(2, Double(Int.random(in: 0...3))) * powl(3, Double(Int.random(in: 0...3))) * powl(5, Double(Int.random(in: 0...2))))
    }
    var answer = a*b
    
    if a > b {
        answer /= GCD(bigger: a, lower: b)
    } else {
        answer /= GCD(bigger: b, lower: a)
    }
    
    let question = "The LCM of \(a) and \(b) is "
    
    return (question, answer, UIImage(resource: .LCM), 10)
}

//Problem 11
func GCD()->(String, Int, UIImage, Int){
    let start = Int.random(in: 11...25)
    let a = start * Int.random(in: 2...9)
    let b = start*Int.random(in: 5...15)
    var answer = 0
    
    if a > b {
        answer = GCD(bigger: a, lower: b)
    } else {
        answer = GCD(bigger: b, lower: a)
    }
    
    let question = "Find the GCD of \(a) and \(b)"
    
    return (question, answer, UIImage(resource: .GCD), 11)
}
//problem 11 supplement
func GCD(bigger: Int, lower: Int) -> Int{
    let remainder = bigger%lower
    
    if remainder != 0 && remainder != bigger{
        return GCD(bigger: lower, lower: remainder)
    }else{
        return lower
    }
}

//Problem 12
func TriangularNumbers()->(String, Int, UIImage, Int){
    let n = Int.random(in: 1...7)
    let answer = (n * (n + 1)) / 2
    let question = "Find the \(n)th triangular number"
    
    return (question, answer, UIImage(resource: .squares), 12)
}

//Problem 13
func TwoByTwoMultiplication()->(String, Int, UIImage, Int){
    let num1 = Int.random(in: 11...99)
    let num2 = Int.random(in: 11...99)
    let answer = num1 * num2
    let question = "\(num1) × \(num2) = "
    
    return (question, answer, UIImage(resource: .twoXTwos), 13)
}

//Problem 14
func ImproperFractionMultiplication()->(String, Int, UIImage, Int){
    let num1 = Int.random(in: 2...39)
    let num2 = Int.random(in: 2...39)
    let den2 = Int.random(in: 2...39)
    
    let answer = (num1 * num2) / (den2)
    let question = "\(num1) × \(num2)/\(den2) = "
    
    return (question, answer, UIImage(resource: .nearHundred), 14)
}

//Problem 15
func IntegerSequenceSum()->(String, Int, UIImage, Int){
    let sequenceType = Int.random(in: 0...2) // 0: consecutive, 1: odd, 2: even
    let start = Int.random(in: 1...20)
    let count = 5
    
    var sequence: [Int] = []
    var sum = 0
    
    switch sequenceType {
    case 0: // consecutive
        sequence = Array(start...(start + count - 1))
    case 1: // odd
        let firstOdd = start % 2 == 0 ? start + 1 : start
        sequence = stride(from: firstOdd, through: firstOdd + (count-1)*2, by: 2).map { $0 }
    case 2: // even
        let firstEven = start % 2 == 0 ? start : start + 1
        sequence = stride(from: firstEven, through: firstEven + (count-1)*2, by: 2).map { $0 }
    default:
        break
    }
    
    sum = sequence.reduce(0, +)
    
    let sequenceStr = sequence.map { String($0) }.joined(separator: ", ")
    let question = "Find the sum: \(sequenceStr)"
    
    return (question, sum, UIImage(resource: .squares), 15)
}

//Problem 16
//change this to actually let the answer be within 5%
func RootApproximation()->(String, Int, UIImage, Int){
    let isSquareRoot = Bool.random()
    let num = Int.random(in: 1000...9999999)
    let actualRoot = isSquareRoot ? Int(sqrt(Double(num))) : Int(pow(Double(num), 1.0/3.0))
    let answer = actualRoot
    
    let question = "Approximate the \(isSquareRoot ? "square" : "cube") root of \(num) (within 5%)"
    
    return (question, answer, UIImage(resource: .squares), 16)
}

//Problem 17
func PercentOfNumber() -> (String, Int, UIImage, Int) {
    let percent = Int.random(in: 1...100)
    let number = Int.random(in: 100...999)
    let answer = (number * percent) / 100
    let question = "\(percent)% of \(number) = "
    
    return (question, answer, UIImage(resource: .squares), 17)
}

//Problem 18
func FractionToDecimal() -> (String, Int, UIImage, Int) {
    let denominator = Int.random(in: 2...20)
    let numerator = Int.random(in: 1...denominator-1)
    let answer = Int((Double(numerator) / Double(denominator)) * 100)
    let question = "\(numerator)/\(denominator) = ."
    
    return (question, answer, UIImage(resource: .squares), 18)
}

//Problem 19
func DecimalToFraction() -> (String, Int, UIImage, Int) {
    let decimal = Int.random(in: 1...99)
    let answer = decimal
    let question = ".\(decimal) = /100"
    
    return (question, answer, UIImage(resource: .squares), 19)
}

//Problem 20
func SimpleAddition() -> (String, Int, UIImage, Int) {
    let num1 = Int.random(in: 100...999)
    let num2 = Int.random(in: 100...999)
    let answer = num1 + num2
    let question = "\(num1) + \(num2) = "
    
    return (question, answer, UIImage(resource: .squares), 20)
}

//Problem 21
func SimpleSubtraction() -> (String, Int, UIImage, Int) {
    let num1 = Int.random(in: 100...999)
    let num2 = Int.random(in: 100...999)
    let answer = abs(num1 - num2)
    let question = "\(max(num1, num2)) - \(min(num1, num2)) = "
    
    return (question, answer, UIImage(resource: .squares), 21)
}

//Problem 22
func SimpleMultiplication() -> (String, Int, UIImage, Int) {
    let num1 = Int.random(in: 10...99)
    let num2 = Int.random(in: 10...99)
    let answer = num1 * num2
    let question = "\(num1) × \(num2) = "
    
    return (question, answer, UIImage(resource: .squares), 22)
}

//Problem 23
func SimpleDivision() -> (String, Int, UIImage, Int) {
    let divisor = Int.random(in: 2...12)
    let quotient = Int.random(in: 10...99)
    let dividend = divisor * quotient
    let answer = quotient
    let question = "\(dividend) ÷ \(divisor) = "
    
    return (question, answer, UIImage(resource: .squares), 23)
}

//Problem 24
func SimpleAverage() -> (String, Int, UIImage, Int) {
    let count = Int.random(in: 3...5)
    var numbers: [Int] = []
    var sum = 0
    
    for _ in 0..<count {
        let num = Int.random(in: 10...99)
        numbers.append(num)
        sum += num
    }
    
    let answer = sum / count
    let question = "Average of \(numbers.map { String($0) }.joined(separator: ", ")) = "
    
    return (question, answer, UIImage(resource: .squares), 24)
}

//Problem 25
func SimpleRatio() -> (String, Int, UIImage, Int) {
    let ratio1 = Int.random(in: 1...10)
    let ratio2 = Int.random(in: 1...10)
    let value = Int.random(in: 10...100)
    let answer = (value * ratio2) / ratio1
    let question = "If \(ratio1):\(ratio2) = \(value):x, then x = "
    
    return (question, answer, UIImage(resource: .squares), 25)
}

//Problem 26
func SimplePercent() -> (String, Int, UIImage, Int) {
    let number = Int.random(in: 100...999)
    let percent = Int.random(in: 1...100)
    let answer = (number * percent) / 100
    let question = "\(percent)% of \(number) = "
    
    return (question, answer, UIImage(resource: .squares), 26)
}

//Problem 27
func SimpleInterest() -> (String, Int, UIImage, Int) {
    let principal = Int.random(in: 100...999)
    let rate = Int.random(in: 1...10)
    let time = Int.random(in: 1...5)
    let answer = (principal * rate * time) / 100
    let question = "Simple interest on $\(principal) at \(rate)% for \(time) years = $"
    
    return (question, answer, UIImage(resource: .squares), 27)
}

//Problem 28
func SimplePerimeter() -> (String, Int, UIImage, Int) {
    let length = Int.random(in: 10...50)
    let width = Int.random(in: 10...50)
    let answer = 2 * (length + width)
    let question = "Perimeter of rectangle \(length) × \(width) = "
    
    return (question, answer, UIImage(resource: .squares), 28)
}

//Problem 29
func SimpleArea() -> (String, Int, UIImage, Int) {
    let length = Int.random(in: 10...50)
    let width = Int.random(in: 10...50)
    let answer = length * width
    let question = "Area of rectangle \(length) × \(width) = "
    
    return (question, answer, UIImage(resource: .squares), 29)
}

//Problem 30
func SimpleVolume() -> (String, Int, UIImage, Int) {
    let length = Int.random(in: 5...20)
    let width = Int.random(in: 5...20)
    let height = Int.random(in: 5...20)
    let answer = length * width * height
    let question = "Volume of box \(length) × \(width) × \(height) = "
    
    return (question, answer, UIImage(resource: .squares), 30)
}

//Problem 31
func BaseConversion() -> (String, Int, UIImage, Int) {
    let bases = [2, 8, 16] // binary, octal, hexadecimal
    let fromBase = bases.randomElement()!
    var toBase = bases.randomElement()!
    while toBase == fromBase {
        toBase = bases.randomElement()!
    }
    
    let number = Int.random(in: 1...255)
    let answer = number // We'll keep the answer in decimal for simplicity
    
    let question = "Convert \(number) from base \(fromBase) to base \(toBase)"
    
    return (question, answer, UIImage(resource: .squares), 31)
}

//Problem 32
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

//Problem 33
func ScientificNotation() -> (String, Int, UIImage, Int) {
    let num = Double.random(in: 1...9.99)
    let exponent = Int.random(in: -5...5)
    let answer = Int(num * pow(10.0, Double(exponent)))
    let question = String(format: "%.2f × 10^%d = ", num, exponent)
    
    return (question, answer, UIImage(resource: .squares), 33)
}

//Problem 34
func Probability() -> (String, Int, UIImage, Int) {
    let total = Int.random(in: 10...50)
    let favorable = Int.random(in: 1...total-1)
    let answer = Int((Double(favorable) / Double(total)) * 100)
    let question = "Probability of selecting \(favorable) out of \(total) = %"
    
    return (question, answer, UIImage(resource: .squares), 34)
}

//Problem 35
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

//Problem 36
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

//Problem 37
func ComplexRatio() -> (String, Int, UIImage, Int) {
    let a = Int.random(in: 1...10)
    let b = Int.random(in: 1...10)
    let c = Int.random(in: 1...10)
    let value = Int.random(in: 10...100)
    let answer = (value * b * c) / (a * b)
    let question = "If \(a):\(b):\(c) = \(value):x:\(c), then x = "
    
    return (question, answer, UIImage(resource: .squares), 37)
}

//Problem 38
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

//Problem 39
func CompoundInterest() -> (String, Int, UIImage, Int) {
    let principal = Int.random(in: 100...1000)
    let rate = Double.random(in: 1...10)
    let time = Int.random(in: 1...5)
    let answer = Int(Double(principal) * pow(1 + rate/100, Double(time)))
    let question = "Compound interest on $\(principal) at \(String(format: "%.1f", rate))% for \(time) years = $"
    
    return (question, answer, UIImage(resource: .squares), 39)
}

//Problem 40
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

//Problem 41
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

//Problem 42
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

//Problem 43
func PercentChange() -> (String, Int, UIImage, Int) {
    let original = Int.random(in: 100...1000)
    let change = Int.random(in: 10...100)
    let isIncrease = Bool.random()
    
    let newValue = isIncrease ? original + change : original - change
    let percentChange = Int((Double(change) / Double(original)) * 100)
    let answer = percentChange
    
    let question = "\(original) \(isIncrease ? "increased" : "decreased") to \(newValue). Percent \(isIncrease ? "increase" : "decrease") = %"
    
    return (question, answer, UIImage(resource: .squares), 43)
}

//Problem 44
func PrimeFactorization() -> (String, Int, UIImage, Int) {
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
    
    return (question, answer, UIImage(resource: .squares), 44)
}

//Problem 45
func DivisibilityRules() -> (String, Int, UIImage, Int) {
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
    
    return (question, answer, UIImage(resource: .squares), 45)
}

//Problem 46
func ArithmeticSequences() -> (String, Int, UIImage, Int) {
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
    
    let answer = nthTerm
    let question = "Next term in sequence: \(terms.map { String($0) }.joined(separator: ", ")), ..."
    
    return (question, answer, UIImage(resource: .squares), 46)
}

//Problem 47
func CircleProperties() -> (String, Int, UIImage, Int) {
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
    
    return (question, answer, UIImage(resource: .squares), 47)
}

//Problem 48
func ComplexExponents() -> (String, Int, UIImage, Int) {
    let base = Int.random(in: 2...5)
    let exponent = Int.random(in: 2...5)
    let answer = Int(pow(Double(base), Double(exponent)))
    let question = "\(base)^\(exponent) = "
    
    return (question, answer, UIImage(resource: .squares), 48)
}

//Problem 49
func BinaryOperations() -> (String, Int, UIImage, Int) {
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
    
    return (question, answer, UIImage(resource: .squares), 49)
}

//Problem 50
func TimeProblems() -> (String, Int, UIImage, Int) {
    let hours = Int.random(in: 1...12)
    let minutes = Int.random(in: 0...59)
    let addHours = Int.random(in: 1...5)
    let addMinutes = Int.random(in: 0...59)
    
    var totalMinutes = (hours * 60 + minutes) + (addHours * 60 + addMinutes)
    let newHours = (totalMinutes / 60) % 24
    let newMinutes = totalMinutes % 60
    
    let answer = newHours * 100 + newMinutes
    let question = "If it's \(hours):\(String(format: "%02d", minutes)), what time will it be in \(addHours) hours and \(addMinutes) minutes? (Answer in 24-hour format, e.g., 1430 for 2:30 PM)"
    
    return (question, answer, UIImage(resource: .squares), 50)
}

//Problem 51
func FractionComparison() -> (String, Int, UIImage, Int) {
    let num1 = Int.random(in: 1...9)
    let den1 = Int.random(in: 2...9)
    let num2 = Int.random(in: 1...9)
    let den2 = Int.random(in: 2...9)
    
    // Compare fractions by cross-multiplying
    let comparison = num1 * den2 - num2 * den1
    let answer = comparison > 0 ? 1 : (comparison < 0 ? -1 : 0)
    
    let question = "Compare \(num1)/\(den1) and \(num2)/\(den2) (1 if first is greater, -1 if second is greater, 0 if equal)"
    
    return (question, answer, UIImage(resource: .squares), 51)
}

//Problem 52
func PercentIncreaseDecrease() -> (String, Int, UIImage, Int) {
    let original = Int.random(in: 100...1000)
    let percent = Int.random(in: 5...50)
    let isIncrease = Bool.random()
    
    let change = Int((Double(original) * Double(percent)) / 100.0)
    let newValue = isIncrease ? original + change : original - change
    let answer = newValue
    
    let question = "If \(original) \(isIncrease ? "increases" : "decreases") by \(percent)%, the new value is"
    
    return (question, answer, UIImage(resource: .squares), 52)
}

//Problem 53
func NumberOfFactors() -> (String, Int, UIImage, Int) {
    // Generate a number with a known number of factors
    let primes = [2, 3, 5, 7]
    let exponents = [Int.random(in: 0...2), Int.random(in: 0...2), Int.random(in: 0...2), Int.random(in: 0...2)]
    
    var number = 1
    for i in 0..<primes.count {
        number *= Int(pow(Double(primes[i]), Double(exponents[i])))
    }
    
    // Calculate number of factors
    var factorCount = 1
    for exponent in exponents {
        factorCount *= (exponent + 1)
    }
    
    let answer = factorCount
    let question = "How many factors does \(number) have?"
    
    return (question, answer, UIImage(resource: .squares), 53)
}

//Problem 54
func GeometricSequences() -> (String, Int, UIImage, Int) {
    let firstTerm = Int.random(in: 1...10)
    let ratio = Int.random(in: 2...5)
    let n = Int.random(in: 3...6)
    
    // nth term = a₁ * r^(n-1)
    let nthTerm = firstTerm * Int(pow(Double(ratio), Double(n-1)))
    
    // Generate first few terms for display
    var terms: [Int] = []
    for i in 0..<3 {
        terms.append(firstTerm * Int(pow(Double(ratio), Double(i))))
    }
    
    let answer = nthTerm
    let question = "Next term in sequence: \(terms.map { String($0) }.joined(separator: ", ")), ..."
    
    return (question, answer, UIImage(resource: .squares), 54)
}

//Problem 55
func TriangleProperties() -> (String, Int, UIImage, Int) {
    let propertyType = Int.random(in: 0...2)
    var answer = 0
    var question = ""
    
    switch propertyType {
    case 0: // Area
        let base = Int.random(in: 5...15)
        let height = Int.random(in: 5...15)
        answer = (base * height) / 2
        question = "Area of triangle with base \(base) and height \(height) = "
        
    case 1: // Perimeter
        let side1 = Int.random(in: 5...15)
        let side2 = Int.random(in: 5...15)
        let side3 = Int.random(in: 5...15)
        answer = side1 + side2 + side3
        question = "Perimeter of triangle with sides \(side1), \(side2), and \(side3) = "
        
    case 2: // Pythagorean Theorem
        let a = Int.random(in: 3...8)
        let b = Int.random(in: 3...8)
        answer = Int(sqrt(Double(a*a + b*b)))
        question = "Hypotenuse of right triangle with legs \(a) and \(b) = "
        
    default:
        break
    }
    
    return (question, answer, UIImage(resource: .squares), 55)
}

//Problem 56
func ComplexRadicals() -> (String, Int, UIImage, Int) {
    let radicand = Int.random(in: 10...100)
    let index = Int.random(in: 2...3)
    
    let answer = index == 2 ? Int(sqrt(Double(radicand))) : Int(pow(Double(radicand), 1.0/3.0))
    let question = "\(index == 2 ? "√" : "∛")\(radicand) = "
    
    return (question, answer, UIImage(resource: .squares), 56)
}

//Problem 57
func RateProblems() -> (String, Int, UIImage, Int) {
    let distance = Int.random(in: 10...100)
    let time = Int.random(in: 1...10)
    let rate = distance / time
    
    let answer = rate
    let question = "If a car travels \(distance) miles in \(time) hours, its speed is mph"
    
    return (question, answer, UIImage(resource: .squares), 57)
}

//Problem 58
func WorkProblems() -> (String, Int, UIImage, Int) {
    let worker1Time = Int.random(in: 2...8)
    let worker2Time = Int.random(in: 2...8)
    
    // Combined work rate = 1/t1 + 1/t2 = 1/total
    // Therefore, total = (t1 * t2) / (t1 + t2)
    let totalTime = (worker1Time * worker2Time) / (worker1Time + worker2Time)
    
    let answer = totalTime
    let question = "If Worker A can complete a job in \(worker1Time) hours and Worker B can complete it in \(worker2Time) hours, how many hours will it take them working together?"
    
    return (question, answer, UIImage(resource: .squares), 58)
}

//Problem 59
func DistanceSpeedTime() -> (String, Int, UIImage, Int) {
    let speed = Int.random(in: 10...60)
    let time = Int.random(in: 1...5)
    let distance = speed * time
    
    let answer = distance
    let question = "If a car travels at \(speed) mph for \(time) hours, how far does it travel?"
    
    return (question, answer, UIImage(resource: .squares), 59)
}

//Problem 60
func SpecialMultiplicationTricks() -> (String, Int, UIImage, Int) {
    let trickType = Int.random(in: 0...2)
    var answer = 0
    var question = ""
    
    switch trickType {
    case 0: // Multiply by 11
        let num = Int.random(in: 10...99)
        let digits = String(num).map { Int(String($0))! }
        let middleDigit = digits[0] + digits[1]
        let carry = middleDigit / 10
        answer = digits[0] * 100 + (middleDigit % 10) * 10 + digits[1]
        if carry > 0 {
            answer += carry * 100
        }
        question = "\(num) × 11 = "
        
    case 1: // Multiply by 25
        let num = Int.random(in: 10...99)
        answer = num * 25
        question = "\(num) × 25 = "
        
    case 2: // Multiply by 101
        let num = Int.random(in: 10...99)
        answer = num * 101
        question = "\(num) × 101 = "
        
    default:
        break
    }
    
    return (question, answer, UIImage(resource: .squares), 60)
}

//Problem 61
func FibonacciSequences() -> (String, Int, UIImage, Int) {
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
    
    let answer = b
    let question = "Next number in Fibonacci-like sequence: \(start1), \(start2), ..."
    
    return (question, answer, UIImage(resource: .squares), 61)
}

//Problem 62
func PatternRecognition() -> (String, Int, UIImage, Int) {
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
    
    return (question, answer, UIImage(resource: .squares), 62)
}

//Problem 63
func MissingTerms() -> (String, Int, UIImage, Int) {
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
    
    return (question, answer, UIImage(resource: .squares), 63)
}

//Problem 64
func PythagoreanTheorem() -> (String, Int, UIImage, Int) {
    let a = Int.random(in: 3...8)
    let b = Int.random(in: 3...8)
    let c = Int(sqrt(Double(a*a + b*b)))
    
    let answer = c
    let question = "In a right triangle with legs \(a) and \(b), the hypotenuse is"
    
    return (question, answer, UIImage(resource: .squares), 64)
}

//Problem 65
func SimilarFigures() -> (String, Int, UIImage, Int) {
    let scaleFactor = Int.random(in: 2...5)
    let dimension = Int.random(in: 5...15)
    let scaledDimension = dimension * scaleFactor
    
    let answer = scaledDimension
    let question = "If a figure is scaled by a factor of \(scaleFactor) and its original dimension is \(dimension), the new dimension is"
    
    return (question, answer, UIImage(resource: .squares), 65)
}

//Problem 66
func PowerRules() -> (String, Int, UIImage, Int) {
    let base = Int.random(in: 2...5)
    let exponent1 = Int.random(in: 2...4)
    let exponent2 = Int.random(in: 2...4)
    
    // (a^m)^n = a^(m*n)
    let answer = Int(pow(Double(base), Double(exponent1 * exponent2)))
    let question = "(\(base)^\(exponent1))^\(exponent2) = "
    
    return (question, answer, UIImage(resource: .squares), 66)
}

//Problem 67
func OctalOperations() -> (String, Int, UIImage, Int) {
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
    
    return (question, answer, UIImage(resource: .squares), 67)
}

//Problem 68
func HexadecimalOperations() -> (String, Int, UIImage, Int) {
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
    
    return (question, answer, UIImage(resource: .squares), 68)
}

//Problem 69
func BaseAdditionSubtraction() -> (String, Int, UIImage, Int) {
    let base = Int.random(in: 2...16)
    let num1 = Int.random(in: 1...15)
    let num2 = Int.random(in: 1...15)
    let operation = Int.random(in: 0...1)
    var answer = 0
    var question = ""
    
    // Convert decimal numbers to the target base
    let base1 = String(num1, radix: base).uppercased()
    let base2 = String(num2, radix: base).uppercased()
    
    switch operation {
    case 0: // Addition
        answer = num1 + num2
        question = "\(base1)₍\(base)₎ + \(base2)₍\(base)₎ = (answer in decimal)"
        
    case 1: // Subtraction
        answer = max(num1, num2) - min(num1, num2)
        question = "\(String(max(num1, num2), radix: base).uppercased())₍\(base)₎ - \(String(min(num1, num2), radix: base).uppercased())₍\(base)₎ = (answer in decimal)"
        
    default:
        break
    }
    
    return (question, answer, UIImage(resource: .squares), 69)
}

//Problem 70
func Combinations() -> (String, Int, UIImage, Int) {
    let n = Int.random(in: 5...10)
    let r = Int.random(in: 2...4)
    
    // C(n,r) = n!/(r!(n-r)!)
    var numerator = 1
    var denominator = 1
    
    for i in 0..<r {
        numerator *= (n - i)
        denominator *= (i + 1)
    }
    
    let answer = numerator / denominator
    let question = "C(\(n),\(r)) = "
    
    return (question, answer, UIImage(resource: .squares), 70)
}

//Problem 71
func StandardDeviation() -> (String, Int, UIImage, Int) {
    let count = Int.random(in: 3...5)
    var numbers: [Int] = []
    var sum = 0
    
    for _ in 0..<count {
        let num = Int.random(in: 10...100)
        numbers.append(num)
        sum += num
    }
    
    let mean = sum / count
    var sumSquaredDiff = 0
    
    for num in numbers {
        sumSquaredDiff += (num - mean) * (num - mean)
    }
    
    let variance = sumSquaredDiff / count
    let answer = Int(sqrt(Double(variance)))
    
    let question = "Standard deviation of \(numbers.map { String($0) }.joined(separator: ", ")) = "
    
    return (question, answer, UIImage(resource: .squares), 71)
}

//Problem 72
func MedianMode() -> (String, Int, UIImage, Int) {
    let count = Int.random(in: 5...7)
    var numbers: [Int] = []
    
    for _ in 0..<count {
        numbers.append(Int.random(in: 10...100))
    }
    
    numbers.sort()
    
    // Calculate median
    let median = count % 2 == 0 ? (numbers[count/2 - 1] + numbers[count/2]) / 2 : numbers[count/2]
    
    // Calculate mode
    var frequency: [Int: Int] = [:]
    for num in numbers {
        frequency[num, default: 0] += 1
    }
    
    let maxFrequency = frequency.values.max()!
    let mode = frequency.first { $0.value == maxFrequency }!.key
    
    let answer = median // We'll use median as the answer
    let question = "Median of \(numbers.map { String($0) }.joined(separator: ", ")) = "
    
    return (question, answer, UIImage(resource: .squares), 72)
}

//Problem 73
func MixtureProblems() -> (String, Int, UIImage, Int) {
    let concentration1 = Int.random(in: 10...40)
    let concentration2 = Int.random(in: 50...90)
    let volume1 = Int.random(in: 10...50)
    let volume2 = Int.random(in: 10...50)
    
    // Calculate final concentration
    let totalSolute = (concentration1 * volume1 + concentration2 * volume2)
    let totalVolume = volume1 + volume2
    let finalConcentration = totalSolute / totalVolume
    
    let answer = finalConcentration
    let question = "If \(volume1) liters of \(concentration1)% solution is mixed with \(volume2) liters of \(concentration2)% solution, the final concentration is %"
    
    return (question, answer, UIImage(resource: .squares), 73)
}

//Problem 74
func DiscountMarkup() -> (String, Int, UIImage, Int) {
    let originalPrice = Int.random(in: 100...1000)
    let percent = Int.random(in: 5...50)
    let isDiscount = Bool.random()
    
    let change = Int((Double(originalPrice) * Double(percent)) / 100.0)
    let finalPrice = isDiscount ? originalPrice - change : originalPrice + change
    
    let answer = finalPrice
    let question = "If an item costs $\(originalPrice) and is \(isDiscount ? "discounted" : "marked up") by \(percent)%, the final price is $"
    
    return (question, answer, UIImage(resource: .squares), 74)
}

//Problem 75
func TaxProblems() -> (String, Int, UIImage, Int) {
    let price = Int.random(in: 100...1000)
    let taxRate = Int.random(in: 5...10)
    
    let tax = Int((Double(price) * Double(taxRate)) / 100.0)
    let total = price + tax
    
    let answer = total
    let question = "If an item costs $\(price) and the tax rate is \(taxRate)%, the total cost is $"
    
    return (question, answer, UIImage(resource: .squares), 75)
}

//Problem 76
func InvestmentProblems() -> (String, Int, UIImage, Int) {
    let principal = Int.random(in: 1000...10000)
    let rate = Double.random(in: 1...10)
    let time = Int.random(in: 1...5)
    
    // Simple interest
    let interest = Int((Double(principal) * rate * Double(time)) / 100.0)
    let total = principal + interest
    
    let answer = total
    let question = "If $\(principal) is invested at \(String(format: "%.1f", rate))% for \(time) years, the total value is $"
    
    return (question, answer, UIImage(resource: .squares), 76)
}

//Problem 77
func SpecialDivisionTricks() -> (String, Int, UIImage, Int) {
    let trickType = Int.random(in: 0...2)
    var answer = 0
    var question = ""
    
    switch trickType {
    case 0: // Divide by 5
        let num = Int.random(in: 10...100)
        answer = num / 5
        question = "\(num) ÷ 5 = "
        
    case 1: // Divide by 25
        let num = Int.random(in: 100...1000)
        answer = num / 25
        question = "\(num) ÷ 25 = "
        
    case 2: // Divide by 125
        let num = Int.random(in: 100...1000)
        answer = num / 125
        question = "\(num) ÷ 125 = "
        
    default:
        break
    }
    
    return (question, answer, UIImage(resource: .squares), 77)
}

//Problem 78
func SpecialAdditionSubtractionTricks() -> (String, Int, UIImage, Int) {
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
    
    return (question, answer, UIImage(resource: .squares), 78)
}

//Problem 79
func SumOfFactors() -> (String, Int, UIImage, Int) {
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
    
    let answer = sum
    let question = "Sum of all factors of \(number) = "
    
    return (question, answer, UIImage(resource: .squares), 79)
}

//Problem 80
func PerfectNumbers() -> (String, Int, UIImage, Int) {
    // The first few perfect numbers are 6, 28, 496, 8128
    let perfectNumbers = [6, 28, 496, 8128]
    let number = perfectNumbers.randomElement()!
    
    // Sum of proper divisors of a perfect number equals the number itself
    let answer = number
    let question = "Is \(number) a perfect number? (Enter the number if yes, 0 if no)"
    
    return (question, answer, UIImage(resource: .squares), 80)
}

