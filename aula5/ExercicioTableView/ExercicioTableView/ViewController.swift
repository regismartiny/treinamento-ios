//
//  ViewController.swift
//  ExercicioTableView
//
//  Created by InfraCWI on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let mulheres = ["tênis", "blusas", "camisetas", "casaquinhos", "ombro", "short", "calças", "mochila", "relógios", "vestidos", "de mão", "camisas", "chapeu", "saias", "sandálias", "sapatos", "sapatilha", "óculos", "macacão", "perfume", "rasteirinha", "coletes", "clutches", "botas", "cintos", "cabelos", "carteiras", "meia-calça", "bijoux", "cosméticos", "maquiagem", "necessaire", "ternos", "vestidos de festa", "esportes", "outros", "praia", "lingerie"]
    
    let rapazes = ["tênis", "camisetas", "camisas", "casacos", "bonés", "bermudas", "calças", "relógios", "bolsas", "sandálias", "óculos", "sapatos", "perfumes", "blazer", "lenços", "botas", "carteiras", "chapeu", "coletes", "esportes", "outros", "praia", "kids", "pezinho de menino", "roupas de menino", "roupas de menina", "pezinho de menina", "pezinho de bebê", "roupas de bebê", "brinquedos de crescidinhos", "outros"]
    
    let etcetal = ["outros", "esportes e outdoor", "malas", "vintage e retrô", "pets"]
    
    let infoeeletro = ["outros", "iphone", "outros", "outros celulares", "outros"]
    
    let casa = ["decoração"]
    
    var categorias = [[String]]()
    
    var expandedSection = -1
    
    var selectedIndexes = [IndexPath]()
    
    var reloading = false
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categorias.append(mulheres)
        categorias.append(rapazes)
        categorias.append(etcetal)
        categorias.append(infoeeletro)
        categorias.append(casa)
    }

    // MARK: DATA SOURCE METHODS
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func headerTouched(sender: TapHeader) {
        print("touched header")
        let section = sender.index!
        self.expandedSection = section
        self.expandSection()
        
        let itemCount = self.categorias[section].count
        //var indexes = [IndexPath]()
        for var i in (0..<itemCount) {
            //indexes.append(IndexPath(row: i, section: section))
            let index = IndexPath(row: i, section: section)
            tableView.selectRow(at: index, animated: false, scrollPosition: UITableViewScrollPosition.middle)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header-cell") as! HeaderUITableViewCell
        
        var element = ""
        
        switch section {
        case 0:
            element = "Mulheres"
        case 1:
            element = "Rapazes"
        case 2:
            element = "Etcetal"
        case 3:
            element = "Infoeletro"
        case 4:
            element = "Casa"
        default:
            break
        }

        let onTouchRecognizer = TapHeader.init(target: self, action: #selector(self.headerTouched(sender:)))
        onTouchRecognizer.index = section
        cell.addGestureRecognizer(onTouchRecognizer)
        
        cell.config(categoryText: element)

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.categorias.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.expandedSection == section) {
            return self.categorias[section].count
        } else {
            return self.categorias[section].count > 3 ? 4 : self.categorias[section].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //verificar se esta deve exibir o botao de ver mais
        if ( indexPath.row == 3 && expandedSection != indexPath.section) {
            return tableView.dequeueReusableCell(withIdentifier: ViewMoreUITableViewCell.instanceNib) as! ViewMoreUITableViewCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RegularUITableViewCell.instanceNib) as! RegularUITableViewCell
        
        let element = self.categorias[indexPath.section][indexPath.item]
        
        cell.config(itemText: element)
        
        return cell
    }
    


    
    // MARK: DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        
        if tableView.cellForRow(at: indexPath) as? ViewMoreUITableViewCell != nil {
            print("ver mais selecionado")
            self.expandedSection = indexPath.section;
            self.expandSection()
        }
    }
    
    func expandSection() {
        self.selectedIndexes = tableView.indexPathsForSelectedRows != nil ? tableView.indexPathsForSelectedRows! : [IndexPath]()
        self.reloading = true;
        self.tableView.reloadData()
        
        DispatchQueue.main.async(execute: {
            for index in self.selectedIndexes {
                self.tableView.selectRow(at: index, animated: false, scrollPosition: UITableViewScrollPosition.middle)
            }
        })
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        /*if let element = tableView.cellForRow(at: indexPath) as? RegularUITableViewCell {
            print("deselecionou \(String(describing: element.itemLabel.text!))")
        }*/
    }
    
    @IBAction func onPrintAction(_ sender: UIButton) {
        
        let indexPaths = tableView.indexPathsForSelectedRows
        if (indexPaths != nil) {
            print("Itens selecionados:")
            for indexPath in indexPaths! {
                if let currentCell = tableView.cellForRow(at: indexPath) as? RegularUITableViewCell {
                    print(currentCell.itemLabel.text!)
                }
            }
        }
        
    }
    
    

}

