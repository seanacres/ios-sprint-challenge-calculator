//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String.append(digit)
            return operand1String
        } else {
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "+":
             operatorType = OperatorType.addition
        case "−":
            operatorType = OperatorType.subtraction
        case "×":
            operatorType = OperatorType.multiplication
        default:
            operatorType = OperatorType.division
        }
    }
    
    func calculateIfPossible() -> String? {
        
        var result: String = ""
        
        if operand1String != "" && operand2String != "" {
            if let operatorType = operatorType {
                guard let operandNum1 = Double(operand1String) else { return nil }
                guard let operandNum2 = Double(operand2String) else { return nil }
                
                switch operatorType {
                case .addition:
                    result = String(operandNum1 + operandNum2)
                case .subtraction:
                    result = String(operandNum1 - operandNum2)
                case .multiplication:
                    result = String(operandNum1 * operandNum2)
                default:
                    if operandNum2 != 0 {
                        result = String(operandNum1 / operandNum2)
                    } else {
                        return "Error"
                    }
                }
            }
            
        }
        
        return result
    }
}
