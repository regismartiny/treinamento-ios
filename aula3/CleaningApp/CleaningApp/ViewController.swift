//
//  ViewController.swift
//  CleaningApp
//
//  Created by InfraCWI on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblBed: UILabel!
    private var bedCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }

    @IBAction func nextStepAction(_ sender: UIButton) {
        let mainStoryboard = self.storyboard
        let vc : UIViewController = mainStoryboard!.instantiateViewController(withIdentifier: "SecondViewController") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func updateLabels() {
        var txt = String(self.bedCount) + " bed"
        if (self.bedCount > 1) {
            txt = txt + "s"
        }
        self.lblBed.text = txt;
    }

    @IBAction func plusBed(_ sender: UIButton) {
        self.bedCount += 1
        self.updateLabels()
    }
    
    
    @IBAction func minusBed(_ sender: UIButton) {
        if (self.bedCount > 0) {
            self.bedCount -= 1
            self.updateLabels()
        }
    }
}

