/*
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

*/
