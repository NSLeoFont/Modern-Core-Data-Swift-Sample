//
//  AppDelegate.swift
//  CoreDataSample1
//
//  Created by Leonardo Font Garcia on 23/10/2017.
//  Copyright © 2017 Leonardo Font Garcia. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()        
        let configuration = CoordinatorConfiguration(window: window, navigationController: nil, parent: nil)
        let appCoordinator = AppCordinator(config: configuration)
        appCoordinator.start()
    
        return true
    }

}

