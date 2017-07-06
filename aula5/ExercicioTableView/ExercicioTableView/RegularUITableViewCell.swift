//
//  RegularUITableViewCell.swift
//  ExercicioTableView
//
//  Created by InfraCWI on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class RegularUITableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var itemLabel: UILabel!
    
    class var instanceNib : String {
        get {
            return "regular-cell"
        }
    }
    
    func config(itemText: String) {
        self.itemLabel.text = itemText
    }
}
