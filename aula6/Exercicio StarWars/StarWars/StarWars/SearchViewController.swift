//
//  PeopleViewController.swift
//  StarWars
//
//  Created by InfraCWI on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBAction func goBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
