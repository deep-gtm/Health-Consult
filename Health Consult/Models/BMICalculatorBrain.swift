//
//  BMICalculatorBrain.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 12/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import Foundation
import UIKit
struct BMICalculatorBrain {
    var height: Float?
    var weight: Float?
    var bmiValue: Float?
    mutating func calculateBMIValue() {
        if let safeWeight = weight, let safeHeight = height {
            bmiValue = safeWeight / (safeHeight * safeHeight)
        }
    }
    
    mutating func getBMIString() -> String {
        if let safeBMIValue = bmiValue {
            let bmiValueString = String(format: "%.1f", safeBMIValue)
            return bmiValueString
        } else {
            return "0.0"
        }
    }
    
    func getHeightString() -> String {
        if let safeHeight = height {
            let heightValueString = String(format: "%.1f", safeHeight)
            return heightValueString + "m"
        } else {
            return ""
        }
    }
    
    func getWeightString() -> String {
        if let safeWeight = weight {
            let weightValueString = String(format: "%.1f", safeWeight)
            return weightValueString + "Kg"
        } else {
            return ""
        }
    }
    
    func getAdvice() -> String {
        if let safeBMIValue = bmiValue {
            switch safeBMIValue {
            case 1.0..<18.5:
                return "Eat More Frequently.\nChoose Nutrient-rich Foods.\nExcercise Regularly."
            case 18.5..<24.9:
                return "Eat Variety of foods.\nDrink plenty of fluids.\nExcercise Regularly."
            case 24.9..<29.9:
                return "Lose Weight Through Healthy Eating.\nJoin Weight Managment Programs.\nBe More Physically Active."
            case 29.9...:
                return "Lose Weight Through Healthy Eating.\nJoin Weight Managment Programs.\nBe More Physically Active."
            default:
                return ""
            }
        } else {
            return ""
        }
    }
    
    func getColor() -> UIColor {
        if let safeBMIValue = bmiValue {
            switch safeBMIValue {
            case 1.0..<18.5:
                return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            case 18.5..<24.9:
                return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            case 24.9..<29.9:
                return #colorLiteral(red: 1, green: 0.5282984021, blue: 0.1615299789, alpha: 1)
            case 29.9...:
                return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            default:
                return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        } else {
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    func getResult() -> String {
        if let safeBMIValue = bmiValue {
            switch safeBMIValue {
            case 1.0..<18.5:
                return "UNDERWEIGHT"
            case 18.5..<24.9:
                return "HEALTHY"
            case 24.9..<29.9:
                return "OVERWEIGHT"
            case 29.9...:
                return "OBESE"
            default:
                return ""
            }
        } else {
            return ""
        }
    }
}
