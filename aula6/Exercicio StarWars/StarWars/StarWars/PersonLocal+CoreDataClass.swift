//
//  PersonLocal+CoreDataClass.swift
//  StarWars
//
//  Created by InfraCWI on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import CoreData
import UIKit


public class PersonLocal: NSManagedObject {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static let entityName = "PersonLocal"
    
    func create(image: NSData, name: String, height: String, mass: String, hairColor: String) -> PersonLocal {
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: PersonLocal.entityName, into: context) as! PersonLocal
        
        newItem.image = image
        newItem.name = name
        newItem.height = height
        newItem.mass = mass
        newItem.hairColor = hairColor
        
        return newItem
    }
    
    func getById(id: NSManagedObjectID) -> PersonLocal? {
        return context.object(with: id) as? PersonLocal
    }
    
    func get(withPredicate queryPredicate: NSPredicate) -> [PersonLocal]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersonLocal.entityName)
        
        fetchRequest.predicate = queryPredicate
        
        do {
            let response = try context.fetch(fetchRequest)
            return response as! [PersonLocal]
        } catch let error as NSError {
            // failure
            print(error)
            return [PersonLocal]()
        }
    }
    
    func getAll() -> [PersonLocal]{
        return get(withPredicate: NSPredicate(value:true))
    }
    
    func update(updatedPersonLocal: PersonLocal){
        if let PersonLocal = getById(id: updatedPersonLocal.objectID){
            PersonLocal.image = updatedPersonLocal.image
            PersonLocal.name = updatedPersonLocal.name
            PersonLocal.height = updatedPersonLocal.height
            PersonLocal.mass = updatedPersonLocal.mass
            PersonLocal.hairColor = updatedPersonLocal.hairColor
        }
    }
    
    func delete(id: NSManagedObjectID){
        if let PersonLocalToDelete = getById(id: id){
            context.delete(PersonLocalToDelete)
        }
    }

}
