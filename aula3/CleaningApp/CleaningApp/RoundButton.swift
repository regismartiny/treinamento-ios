//
//  RegularButton.swift
//  CleaningApp
//
//  Created by InfraCWI on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class RoundButton : UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 9.5
    }
}
