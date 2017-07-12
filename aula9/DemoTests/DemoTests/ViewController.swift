//
//  ViewController.swift
//  DemoTests
//
//  Created by InfraCWI on 12/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func actionAvancar(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController", sender: Any?)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

