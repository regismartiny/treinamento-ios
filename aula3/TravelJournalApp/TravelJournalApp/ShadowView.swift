//
//  ShadowView.swift
//  TravelJournalApp
//
//  Created by InfraCWI on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        //self.layer.shouldRasterize = true
    }
}
