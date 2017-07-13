//
//  ViewController.swift
//  Animacoes
//
//  Created by InfraCWI on 13/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var centerView: CenterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func actionShrink20Width(_ sender: Any) {
        
        UIView.animate(withDuration: 2, animations: {
            self.centerView.frame.size.width = self.centerView.frame.width - 20
        })
        
    }
    
    @IBAction func actionShrinkHeightBy20(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.centerView.frame.size.height = self.centerView.frame.height - 20
        })
    }
    
    @IBAction func actionMoveRightBy50(_ sender: Any) {
        
        UIView.animate(withDuration: 2, animations: {
            self.centerView.frame.origin = CGPoint(x: self.centerView.frame.origin.x + 50, y: self.centerView.frame.origin.y)
        })
    }
    
    @IBAction func actionMoveLeftBy50(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.centerView.frame.origin = CGPoint(x: self.centerView.frame.origin.x - 50, y: self.centerView.frame.origin.y)
        })
    }
    
    @IBAction func actionMoveUpBy50(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.centerView.frame.origin = CGPoint(x: self.centerView.frame.origin.x, y: self.centerView.frame.origin.y - 50)
        })
    }
    
    
    @IBAction func actionMoveDownBy50(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.centerView.frame.origin = CGPoint(x: self.centerView.frame.origin.x, y: self.centerView.frame.origin.y + 50)
        })
    }
    
    @IBAction func actionFadeIn(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.centerView.alpha = 1
        })
    }
    
    @IBAction func actionFadeOut(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.centerView.alpha = 0
        })
    }
    
    @IBAction func actionMakeItRounded(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.centerView.layer.cornerRadius = self.centerView.frame.width / 2
        })
    }

    @IBAction func actionMakeItSquared(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.centerView.layer.cornerRadius = 0
        })
    }

}

