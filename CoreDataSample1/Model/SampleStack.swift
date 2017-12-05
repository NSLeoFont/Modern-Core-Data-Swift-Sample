//
//  SampleStack.swift
//  CoreDataSample1
//
//  Created by Leo Font on 23/10/2017.
//  Copyright © 2017 Leo Font. All rights reserved.
//

import CoreData

func createSampleContainer(completion: @escaping (NSPersistentContainer) -> ()) {
    let container = NSPersistentContainer(name:"PersonStore")
    container.loadPersistentStores { _, error in
        guard error == nil else { fatalError("Failed to load store: \(String(describing: error))") }
        DispatchQueue.main.async {
            completion(container)
        }
    }
}
