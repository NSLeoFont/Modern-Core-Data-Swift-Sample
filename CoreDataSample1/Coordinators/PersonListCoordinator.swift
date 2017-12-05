//
//  PersonListCoordinator.swift
//  CoreDataSample1
//
//  Created by Leo Font on 23/10/2017.
//  Copyright © 2017 LeoFont. All rights reserved.
//

import UIKit
import CoreData

final class PersonListCoordinator: Coordinator {
    
    let configuration: CoordinatorConfiguration
    var childCoordinator: Coordinator?
    fileprivate var managedObjectContext: NSManagedObjectContext!
    
    
    init(config: CoordinatorConfiguration) {
        self.configuration = config
        self.managedObjectContext = config.managedObjectContext
    }
    
    func start() {
        //Here we would inject services, view Models etc
        let personListController = PersonTableViewController(context: managedObjectContext)
        configuration.navigationController?.pushViewController(personListController, animated: true)
        
    }
    
 
}
