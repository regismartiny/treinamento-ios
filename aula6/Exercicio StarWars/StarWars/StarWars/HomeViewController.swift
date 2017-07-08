//
//  ViewController.swift
//  StarWars
//
//  Created by InfraCWI on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var peopleButton: RoundShadowedView!
    @IBOutlet weak var starshipButton: RoundShadowedView!
    @IBOutlet weak var filmButton: RoundShadowedView!
    @IBOutlet weak var planetsButton: RoundShadowedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tap = UITapGestureRecognizer(target: self, action: #selector(peopleButtonTapped))
        peopleButton.addGestureRecognizer(tap)
        tap = UITapGestureRecognizer(target: self, action: #selector(starshipButtonTapped))
        starshipButton.addGestureRecognizer(tap)
        tap = UITapGestureRecognizer(target: self, action: #selector(filmButtonTapped))
        filmButton.addGestureRecognizer(tap)
        tap = UITapGestureRecognizer(target: self, action: #selector(planetsButtonTapped))
        planetsButton.addGestureRecognizer(tap)
    }
    
    func peopleButtonTapped(sender:UITapGestureRecognizer) {
        print("go to people")
        let mainStoryboard = self.storyboard
        let vc : UIViewController = mainStoryboard!.instantiateViewController(withIdentifier: "search-view") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func starshipButtonTapped(sender:UITapGestureRecognizer) {
        print("go to starship")
        let mainStoryboard = self.storyboard
        let vc : UIViewController = mainStoryboard!.instantiateViewController(withIdentifier: "starship-view") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func filmButtonTapped(sender:UITapGestureRecognizer) {
        print("go to film")
        let mainStoryboard = self.storyboard
        let vc : UIViewController = mainStoryboard!.instantiateViewController(withIdentifier: "film-view") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func planetsButtonTapped(sender:UITapGestureRecognizer) {
        print("go to planets")
        let mainStoryboard = self.storyboard
        let vc : UIViewController = mainStoryboard!.instantiateViewController(withIdentifier: "planets-view") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

