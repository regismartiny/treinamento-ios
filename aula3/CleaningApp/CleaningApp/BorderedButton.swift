//
//  BorderedButton.swift
//  CleaningApp
//
//  Created by InfraCWI on 05/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class BorderedButton : UIButton {
    override func awakeFromNib() {
        self.layer.borderColor = UIColor(red:72/255.0, green:179/255.0, blue:226/255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 3
    }
}
