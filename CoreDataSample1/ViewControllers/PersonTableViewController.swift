//
//  PersonTableViewController.swift
//  CoreDataSample1
//
//  Created by Leo Font on 23/10/2017.
//  Copyright © 2017 Leonardo Font Garcia. All rights reserved.
//

import UIKit
import CoreData

final class PersonTableViewController: UITableViewController {
    
    // No View Models, no MVVM. This is just a simple Core Data test.
    
    fileprivate var managedObjectContext: NSManagedObjectContext!
    
    init(context: NSManagedObjectContext){
        super.init(nibName: String(describing: PersonTableViewController.self), bundle: nil)
        self.managedObjectContext = context
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Persons"
        setupTableView()
                
        self.managedObjectContext.performChanges {
            let randomAge = arc4random_uniform(100)
            let _ = Person.insert(into: self.managedObjectContext, name: "Walter White", age: Int32(randomAge), information: "Da boss")
             let _ = Person.insert(into: self.managedObjectContext, name: "Jesse Pinkman", age: Int32(randomAge), information: "The helper")
             let _ = Person.insert(into: self.managedObjectContext, name: "Gus Fring", age: Int32(randomAge), information: "A dangerous guy")
             let _ = Person.insert(into: self.managedObjectContext, name: "Hank Schrader", age: Int32(randomAge), information: "The cop")
        }
    }

    fileprivate var dataSource: TableViewDataSource<PersonTableViewController>!
    
    fileprivate func setupTableView() {
        let nib = UINib(nibName: String(describing: PersonTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PersonTableViewCell.cellIdentifier)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        let request = Person.sortedFetchRequest
        request.fetchBatchSize = 20
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        dataSource = TableViewDataSource(tableView: tableView, cellIdentifier: PersonTableViewCell.cellIdentifier, fetchedResultsController: frc, delegate: self)
    }
}

extension PersonTableViewController: TableViewDataSourceDelegate {
    func configure(_ cell: PersonTableViewCell, for object: Person) {
        cell.configure(for: object)
    }
}
