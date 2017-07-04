//
//  ViewController.swift
//  TravelJournalApp
//
//  Created by InfraCWI on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func helpClick(_ sender: UIButton) {
        
    }

    @IBAction func infoClick(_ sender: UIButton) {
        let mainStoryboard = self.storyboard
        let vc : UIViewController = mainStoryboard!.instantiateViewController(withIdentifier: "InfoViewController") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

