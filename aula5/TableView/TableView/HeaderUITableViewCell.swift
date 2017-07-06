//
//  HeaderUITableViewCell.swift
//  TableView
//
//  Created by InfraCWI on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
class HeaderUITableViewCell : UITableViewCell {
    
    @IBOutlet weak var stateText: UILabel!
    
    func config(stateText: String) {
        self.stateText.text = stateText
    }
}
