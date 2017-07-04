//
//  ViewController.swift
//  Exercicio1
//
//  Created by InfraCWI on 01/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit


class ViewController: UIViewController {


    private var validator = Validator()
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var lblAlert: UILabel!
    @IBOutlet weak var optGender: UISegmentedControl!
    
    private enum Gender {
        case MASCULINO
        case FEMININO
    }
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }

    
    func validateForm() -> Bool {
        var valid = true;

        self.lblAlert.text = ""
        
        let name = self.txtName.text!
        let email = self.txtEmail.text!
        let age = Int(self.txtAge.text!)
        
        if (!validator.isValidName(testStr: name)) {
            valid = false;
            self.lblAlert.text = self.lblAlert.text! + "-Nome inválido: Deve ter nome e sobrenome."
        }
        if (!validator.isValidEmail(testStr: email)) {
            valid = false;
            self.lblAlert.text = self.lblAlert.text! + "\n-Email inválido."
        }
        if (age == nil || !validator.isValidAge(testInt: age!)) {
            valid = false;
            self.lblAlert.text = self.lblAlert.text! + "\n-Idade inválida: Deve ser maior que 18."
        }
        
        return valid;
    }
    
    @IBAction func submitForm(_ sender: UIButton) {

        if (self.validateForm()) {
            let gender = self.optGender.selectedSegmentIndex == 0 ? Gender.MASCULINO : Gender.FEMININO
            //submit the form...
        }
        
    }
    
    
}

