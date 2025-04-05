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
    let Index_Value = [0,5,2,5,2,5,2]
    let num1Arabic = Int.random(in: -3999..<4000)
    let num2Arabic = Int.random(in: -3999..<4000)
    let answerArabic = num1Arabic+num2Arabic
    var question = ""
    var romanNumeralStack1: [Int] = []
    var romanNumeralStack2: [Int] = []
    
    var num1IntTemp = abs(num1Arabic)
    var num2IntTemp = abs(num2Arabic)
    
    //1000
    romanNumeralStack1.insert((num1IntTemp/1000), at: 0)
    romanNumeralStack2.insert((num2IntTemp/1000), at: 0)
    num1IntTemp %= 1000
    num2IntTemp %= 1000
    
    
    //500
    romanNumeralStack1.insert((num1IntTemp/500), at: 0)
    romanNumeralStack2.insert((num2IntTemp/500), at: 0)
    num1IntTemp %= 500
    num2IntTemp %= 500
    
    // 100
    romanNumeralStack1.insert((num1IntTemp/100), at: 0)
    romanNumeralStack2.insert((num2IntTemp/100), at: 0)
    num1IntTemp %= 100
    num2IntTemp %= 100
    
    //50
    romanNumeralStack1.insert((num1IntTemp/50), at: 0)
    romanNumeralStack2.insert((num2IntTemp/50), at: 0)
    num1IntTemp %= 50
    num2IntTemp %= 50
    
    //10
    romanNumeralStack1.insert((num1IntTemp/10), at: 0)
    romanNumeralStack2.insert((num2IntTemp/10), at: 0)
    num1IntTemp %= 10
    num2IntTemp %= 10
    
    //5
    romanNumeralStack1.insert((num1IntTemp/5), at: 0)
    romanNumeralStack2.insert((num2IntTemp/5), at: 0)
    num1IntTemp %= 5
    num2IntTemp %= 5
    
    //1
    romanNumeralStack1.insert((num1IntTemp), at: 0)
    romanNumeralStack2.insert((num2IntTemp), at: 0)
    
    var question1 = ""
    var question2 = ""
    for i in 0...6 {
        if romanNumeralStack1[i] > 3 {
            question1 += String(repeating: ROMAN_NUMERALS[i], count: Index_Value[i+1] - romanNumeralStack1[i]) + ROMAN_NUMERALS[i+1]
        }else{
            question1 += String(repeating: ROMAN_NUMERALS[i], count: romanNumeralStack1[i])
        }
        
        if romanNumeralStack2[i] > 3 {
            question2 += String(repeating: ROMAN_NUMERALS[i], count: Index_Value[i+1] - romanNumeralStack2[i]) + ROMAN_NUMERALS[i+1]
        }else{
            question2 += String(repeating: ROMAN_NUMERALS[i], count: romanNumeralStack2[i])
        }
        
    }
    question1 = String(question1.reversed())
    question2 = String(question2.reversed())
    
    question = "In Arabic Numerals: " + ((num1Arabic<0) ? "-" : "") + question1 + " + " + ((num2Arabic<0) ? "-" : "") + question2 + " = "
    
    
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
    let a = Int.random(in: 11...25) * Int.random(in: 1...4)
    let b = a*Int.random(in: 10...25)
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

