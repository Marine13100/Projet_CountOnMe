//
//  Calculator.swift
//  CountOnMe
//
//  Created by Marine Bernard on 03/08/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

protocol CalculatorDisplay {
    func updateCalcul(calculText: String)
    func showAlert(message: String)
}

class Calculator {
    
    var calculText = "1 + 1 = 2" {
        didSet {
            calculatorDisplayDelegate?.updateCalcul(calculText: calculText)
        }
    }
    
    var calculatorDisplayDelegate: CalculatorDisplay?
    
    var elements: [String] {
        return calculText.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    var expressionHaveResult: Bool {
        return calculText.firstIndex(of: "=") != nil
    }
    
    func tappedNumberButton(numberText: String) {
        if expressionHaveResult {
            calculText = ""
        }
        
        calculText.append(numberText)
    }
    
    func tappedAdditionButton() {
        if canAddOperator {
            calculText.append(" + ")
        } else {
            calculatorDisplayDelegate?.showAlert(message: "Un operateur est déja mis !")

            
        }
    }
    
    func tappedSubstractionButton() {
        if canAddOperator {
            calculText.append(" - ")
        } else {
            calculatorDisplayDelegate?.showAlert(message: "Un operateur est déja mis !")
            
        }
    }
    
    func tappedEqualButton() {
        guard expressionIsCorrect else {
            calculatorDisplayDelegate?.showAlert(message: "Entrez une expression correcte !")
            
            return
        }
        
        guard expressionHaveEnoughElement else {
            calculatorDisplayDelegate?.showAlert(message: "Démarrez un nouveau calcul !")
            
            return
        }
        
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            guard let left = Int(operationsToReduce[0]) else { return }
            let operand = operationsToReduce[1]
            guard let right = Int(operationsToReduce[2]) else { return }
            
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            default: return
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        
        calculText.append(" = \(operationsToReduce.first!)")
    }
}
