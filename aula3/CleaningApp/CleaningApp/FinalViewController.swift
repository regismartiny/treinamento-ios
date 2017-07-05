//
//  FinalViewController.swift
//  CleaningApp
//
//  Created by InfraCWI on 05/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class FinalViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
