//
//  ViewController.swift
//  TableView
//
//  Created by InfraCWI on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var states: Dictionary<String, [String]>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        states = [
            "São Paulo": self.sp,
            "Rio de Janeiro": self.rj,
            "Rio Grande do Sul": self.rs
        ]
    }
    
    let sp = [
        "Barueri",
        "Campinas"
    ]
    
    let rj = [
        "Niter[oi",
        "Petrópolis"
    ]
    
    let rs = [
        "Porto Alegre"
    ]

    //DATA SOURCE METHODS
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "header-cell") as! HeaderUITableViewCell
        
        let element = self.states?.keys.
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.states.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.states[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regular-cell") as! RegularUITableViewCell
        let element = self.states[indexPath.section][indexPath.item]
        
        cell.config(cityText: element)
        
        return cell
    }
    
    //DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    


}

