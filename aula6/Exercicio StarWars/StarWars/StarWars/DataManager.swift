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
    
    class func saveOrUpdateAll(people: [Person], completion: @escaping (_ error: Int) -> Void) {
        
        let pl = PersonLocal()
        
        for person in people {
            if let personLocal = pl.getByName(name: person.name) {
                if personLocal.count > 0 {
                    pl.update(updatedPersonLocal: personLocal[0])
                }
            } else {
                pl.create(person: person)
            }
        }
        
        completion(0)
        
    }

    
    class func getAll(completion: @escaping (_ people: [Person], _ error: Int) -> Void) {
        
        let pl = PersonLocal()
        
        var people = [Person]()

        let  peopleLocal = pl.getAll()
            
        print("Total people in base: \(peopleLocal.count)")
            
        for personLocal in peopleLocal {
            let person = Person(image: personLocal.image, name: personLocal.name!, height: personLocal.height!, mass: personLocal.mass!, hairColor: personLocal.hairColor!)
            people.append(person)
            print("Person fetched: ")
            print(personLocal)
        }
        
        completion(people, 0)
    }
    
    class func deleteAll() {
        
        
        let pl = PersonLocal()
        for person in pl.getAll() {
            pl.delete(id: person.objectID)
        }
    }
}
