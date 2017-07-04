//
//  RoundButton.swift
//  TravelJournalApp
//
//  Created by InfraCWI on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class RoundButton : UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

