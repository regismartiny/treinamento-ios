//
//  Validator.swift
//  Questionario
//
//  Created by InfraCWI on 03/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class Validator {
    
    func isValidName(testStr:String) -> Bool {
        let nameRegEx = "^[a-zA-Z\\s]+ [a-zA-Z\\s]+"
        let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return nameTest.evaluate(with: testStr)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidAge(testInt:Int) -> Bool {
        return (testInt > 18)
    }
}
