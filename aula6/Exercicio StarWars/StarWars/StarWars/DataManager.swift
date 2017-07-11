//
//  DataManager.swift
//  StarWars
//
//  Created by InfraCWI on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataManager {
    
    class func saveAll(people: [Person], completion: @escaping (_ error: Int) -> Void) {
        
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "PersonLocal",
                                       in: managedContext)!
        
        let personLocal = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        
        for person in people {
            // 3

            personLocal.setValue(NSData(), forKey: "image")
            personLocal.setValue(person.name, forKey: "name")
            personLocal.setValue(person.height, forKey: "height")
            personLocal.setValue(person.mass, forKey: "mass")
            personLocal.setValue(person.hairColor, forKey: "hairColor")
            
            //4
            do {
                try managedContext.save()
                print("Person saved: ")
                print(person)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        
        completion(0)
    }
    
    class func getAll(completion: @escaping (_ people: [Person], _ error: Int) -> Void) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
    
        
        var peopleLocal = [PersonLocal]()

        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonLocal")
        do {
            peopleLocal = try managedContext.fetch(fetchRequest) as! [PersonLocal]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        var people = [Person]()
        
        for personLocal in peopleLocal {
            let person = Person(image: personLocal.image, name: personLocal.name!, height: personLocal.height!, mass: personLocal.mass!, hairColor: personLocal.hairColor!)
            people.append(person)
            print("Person fetched: ")
            print(personLocal)
        }
        
        completion(people, 0)
    }
}
