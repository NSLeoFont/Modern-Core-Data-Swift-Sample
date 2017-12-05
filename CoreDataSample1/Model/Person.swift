//
//  Person.swift
//  CoreDataSample1
//
//  Created by Leo Font on 23/10/2017.
//  Copyright © 2017 Leo Font. All rights reserved.
//

import UIKit
import CoreData

final class Person: NSManagedObject {
    
    @NSManaged fileprivate(set) var name: String
    @NSManaged fileprivate(set) var information: String
    @NSManaged public fileprivate(set) var age: Int32
    
    public static func insert(into context: NSManagedObjectContext, name: String, age: Int32, information: String) -> Person {
        let person: Person = context.insertObject()
        person.name = name
        person.age = age
        person.information = information
        return person
    }
    
}

extension Person: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(name), ascending: false)]
    }
}

