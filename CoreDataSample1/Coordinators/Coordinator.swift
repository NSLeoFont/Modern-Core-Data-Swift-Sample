//
//  Coordinator.swift
//  CoreDataSample1
//
//  Created by Leo Font on 23/10/2017.
//  Copyright © 2017 LeoFont. All rights reserved.
//

import UIKit
import CoreData

protocol Coordinator {
    var childCoordinator: Coordinator? { get set }
    init(config: CoordinatorConfiguration)
    func start()
}

struct CoordinatorConfiguration {
    let window: UIWindow?
    let navigationController: UINavigationController?
    let parent: Coordinator?
    var managedObjectContext: NSManagedObjectContext? 
    
    init(window: UIWindow? = nil, navigationController: UINavigationController?, parent: Coordinator?, context: NSManagedObjectContext? = nil) {
        self.window = window
        self.navigationController = navigationController
        self.parent = parent
        self.managedObjectContext = context
    }
}

