//
//  ThirdViewController.swift
//  CleaningApp
//
//  Created by InfraCWI on 05/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ThirdViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextStepAction(_ sender: UIButton) {
        let mainStoryboard = self.storyboard
        let vc : UIViewController = mainStoryboard!.instantiateViewController(withIdentifier: "FinalViewController") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
