//
//  ViewController.swift
//  Questionario
//
//  Created by InfraCWI on 03/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//


import UIKit


class ViewController: UIViewController {
    
    
    private var validator = Validator()
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!

    @IBOutlet weak var optGender: UISegmentedControl!
    
    private var Gender = [
        0: "MASCULINO",
        1: "FEMININO"
    ]
    
    private var DayOfWeek = [
        0: "DOMINGO",
        1: "SEGUNDA-FEIRA",
        2: "TERÇA-FEIRA",
        3: "QUARTA-FEIRA",
        4: "QUINTA-FEIRA",
        5: "SEXTA-FEIRA",
        6: "SÁBADO"
    ]
    
    private var Class = [
        0: "MATEMÁTICA",
        1: "PORTUGUÊS",
        2: "CIÊNCIAS",
        3: "GEOGRAFIA"
    ]
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    
    func validateForm() -> Bool {
        var valid = true;
        
        //self.lblAlert.text = ""
        
        let name = self.txtName.text!
        let age = Int(self.txtAge.text!)
        
        if (!validator.isValidName(testStr: name)) {
            valid = false;
            //self.lblAlert.text = self.lblAlert.text! + "-Nome inválido: Deve ter nome e sobrenome."
        }
        if (age == nil || !validator.isValidAge(testInt: age!)) {
            valid = false;
            //self.lblAlert.text = self.lblAlert.text! + "\n-Idade inválida: Deve ser maior que 18."
        }
        
        return valid;
    }
    
    @IBAction func submitForm(_ sender: UIButton) {
        
        if (self.validateForm()) {
            let gender = Gender[self.optGender.selectedSegmentIndex]
            //submit the form...
        }
        
    }
    
    
}



