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
    @IBOutlet weak var lblBath: UILabel!
    private var bedCount = 1
    private var bathCount = 1
    
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
    
    private func updateBedLabel() {
        var txt = String(self.bedCount) + " bed"
        if (self.bedCount > 1) {
            txt = txt + "s"
        }
        self.lblBed.text = txt;
    }
    
    private func updateBathLabel() {
        var txt = String(self.bathCount) + " bath"
        if (self.bathCount > 1) {
            txt = txt + "s"
        }
        self.lblBath.text = txt;
    }

    @IBAction func plusBed(_ sender: UIButton) {
        self.bedCount += 1
        self.updateBedLabel()
    }
    
    @IBAction func minusBed(_ sender: UIButton) {
        if (self.bedCount > 0) {
            self.bedCount -= 1
            self.updateBedLabel()
        }
    }
    
    @IBAction func minusBath(_ sender: UIButton) {
        if (self.bathCount > 0) {
            self.bathCount -= 1
            self.updateBathLabel()
        }
    }

    @IBAction func plusBath(_ sender: UIButton) {
        self.bathCount += 1
        self.updateBathLabel()
    }
    
}

