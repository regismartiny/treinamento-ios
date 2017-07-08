//
//  PeopleViewController.swift
//  StarWars
//
//  Created by InfraCWI on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//
import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func goBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func loadData() {
        /*Person.getPerson(1) { (person, error) in
            if let response = person {
                if error == 0 {
                    self.person = response
                }
            } else {
                print("Sem internet")
            }
            self.person = person
            self.loaderActivityIndicator.stopAnimating()
        }*/
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCellRow.instanceNib) as! TableCellRow
        
        let element = "TEXTO"
        
        cell.config(itemImage: nil, itemText: element)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        
        
    }
}
