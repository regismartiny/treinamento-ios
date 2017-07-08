//
//  PeopleViewController.swift
//  StarWars
//
//  Created by InfraCWI on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//
import Foundation
import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var myTableView: UITableView!
    var items = [Person]()
    
    override func viewDidLoad() {
        self.loadData()
    }
    
    
    @IBAction func goBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func loadData() {
        Person.getAll() { (person, error) in
            if let response = person {
                if error == 0 {
                    self.items = response
                    print(response)
                }
            } else {
                print("Sem internet")
            }
            
            self.myTableView.reloadData()
            print("OK")
            //self.loaderActivityIndicator.stopAnimating()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count < 6 ? self.items.count : 6 ///Exibir apenas 6 itens
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCellRow.instanceNib) as! TableCellRow
        
        let person = self.items[indexPath.row]
        //let item = element as! Person
        
        cell.config(itemImage: nil, itemText: person.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        let mainStoryboard = self.storyboard
        let vc : UIViewController = mainStoryboard!.instantiateViewController(withIdentifier: "detail-view") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
