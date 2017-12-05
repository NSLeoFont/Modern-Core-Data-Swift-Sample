//
//  AppCoordinator.swift
//  CoreDataSample1
//
//  Created by Leo Font on 23/10/2017.
//  Copyright © 2017 LeoFont. All rights reserved.
//

import UIKit
import CoreData

final class AppCordinator: Coordinator {
    fileprivate let configuration: CoordinatorConfiguration
    internal var childCoordinator: Coordinator?
    var persistentContainer: NSPersistentContainer!
    let navigationController = UINavigationController()
    
    init(config: CoordinatorConfiguration) {
        self.configuration = config
    }
    
    func start() {
        
        configuration.window?.rootViewController = navigationController
        configuration.window?.makeKeyAndVisible()
        createSampleContainer { container in
            self.persistentContainer = container
            let personListConfiguration = CoordinatorConfiguration(navigationController: self.navigationController, parent: self, context: self.persistentContainer.viewContext )
            self.childCoordinator = PersonListCoordinator(config: personListConfiguration)
            self.childCoordinator?.start()
        }
    }
}

