//
//  RegularUITableViewCell.swift
//  TableView
//
//  Created by InfraCWI on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class RegularUITableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(cityText: String) {
        self.cityLabel.text = cityText
    }
    
    
    
}
