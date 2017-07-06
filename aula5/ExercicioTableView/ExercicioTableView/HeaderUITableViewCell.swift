//
//  HeaderUITableViewCell.swift
//  ExercicioTableView
//
//  Created by InfraCWI on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class HeaderUITableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    class var instanceNib : String {
        get {
            return "header-cell"
        }
    }
    
    func config(categoryText: String) {
        self.categoryLabel.text = categoryText
    }
    
}
