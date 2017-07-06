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
        
        cell.config(categoryText: element)
                
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.categorias.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categorias[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //verificar se esta deve exibir o botao de ver mais
        if (  )) == 4) {
            return tableView.dequeueReusableCell(withIdentifier: ViewMoreUITableViewCell.instanceNib) as! ViewMoreUITableViewCell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RegularUITableViewCell.instanceNib) as! RegularUITableViewCell
        
        let element = self.categorias[indexPath.section][indexPath.item]
        
        cell.config(itemText: element)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if ( ((indexPath.item + 1) / (indexPath.section + 1)) > 4) {
            return 0
        } else {
            return 30.0
        }
    }
    
    // MARK: DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let element = tableView.cellForRow(at: indexPath) as? RegularUITableViewCell {
            print("selecionou \(String(describing: element.itemLabel.text!))")

        } else if tableView.cellForRow(at: indexPath) as? ViewMoreUITableViewCell != nil {
            print("ver mais selecionado")
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let element = tableView.cellForRow(at: indexPath) as? RegularUITableViewCell {
            print("deselecionou \(String(describing: element.itemLabel.text!))")
        }
    }
    
    @IBAction func onPrintAction(_ sender: UIButton) {
        
        let indexPaths = tableView.indexPathsForSelectedRows
        if (indexPaths != nil) {
            for indexPath in indexPaths! {
                let currentCell = tableView.cellForRow(at: indexPath) as! RegularUITableViewCell
        
                print(currentCell.itemLabel.text!)
            }
        }
        
    }
    
    

}

