//
//  CalculatorBrain.swift
//  Calculadora
//
//  Created by InfraCWI on 01/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation


struct CalculatorBrain {

    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π": .constant(Double.pi),
        "e": .constant(M_E),
        "√": .unaryOperation(sqrt),
        "+": .binaryOperation({$0 + $1}),
        "-": .binaryOperation({$0 - $1}),
        "*": .binaryOperation({$0 * $1}),
        "/": .binaryOperation({$0 / $1}),
        "=": .equals
    ]
    
    
    mutating func setOperator(_ operand: Double) {
        self.accumulator = operand
    }
    
    private var pbo : PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: ((Double, Double) -> Double)
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pbo != nil && accumulator != nil {
            accumulator = pbo!.perform(with: accumulator!)
            pbo = nil
        }
    }
    
    mutating func performOperation(operador: String) {
        if let operation = self.operations[operador] {
            switch operation {
            case .constant(let value):
                self.accumulator = value
                break
            case .unaryOperation(let function):
                if self.accumulator != nil {
                    self.accumulator = function(accumulator!)
                }
                break
            case .binaryOperation(let function):
                if accumulator != nil {
                    pbo = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
                break
            case .equals:
                performPendingBinaryOperation()
                break
            default:
                break
            }
        }

    }
    
    var result : Double? {
        get {
            return accumulator
        }
    }
}
