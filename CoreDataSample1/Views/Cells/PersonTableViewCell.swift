//
//  PersonTableViewCell.swift
//  CoreDataSample1
//
//  Created by Leo Font on 23/10/2017.
//  Copyright © 2017 Leo Font. All rights reserved.
//

import UIKit

final class PersonTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "PersonCell"
    
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var ageLabel: UILabel!
    
}

extension PersonTableViewCell {
    func configure(for person: Person) {
        self.ageLabel.text = "Age: " + String(person.age)
        self.nameLabel.text = person.name
    }
}


