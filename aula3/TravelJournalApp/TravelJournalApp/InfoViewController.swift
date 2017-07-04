//
//  InfoViewController.swift
//  TravelJournalApp
//
//  Created by InfraCWI on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
