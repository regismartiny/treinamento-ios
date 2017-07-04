//
//  ViewController.swift
//  Calculadora
//
//  Created by InfraCWI on 01/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var history: UITextView!
    
    private var userIsInTheMiddleOfTyping = false
    private var brain = CalculatorBrain()
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if (self.userIsInTheMiddleOfTyping) {
            let textCurrentInDisplay = display.text!
            self.display.text = textCurrentInDisplay + digit
        } else {
            self.display.text = digit
            self.userIsInTheMiddleOfTyping = true;
        }
    }
    
    var displayValue: Double {
        get {
            return Double(self.display.text!)!
        }
        set {
            self.display.text = String(newValue)
        }
    }
    
    @IBAction func performAction(_ sender: UIButton) {
        
        if let action = sender.currentTitle {
            if action == "C" {
                self.display.text = "0"
                self.userIsInTheMiddleOfTyping = false;
            }
        }
    }
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userIsInTheMiddleOfTyping {
            brain.setOperator(displayValue)
            self.userIsInTheMiddleOfTyping = false;
        }
        
        let operation = sender.currentTitle
        if (operation != nil) {
            brain.performOperation(operador: operation!)
        }
        
        let result = brain.result
        if result != nil {
            displayValue = result!
            
            if operation == "=" {
                history.text = history.text + "\n" + String(result!)
            }
        }
        
    }
    
}

