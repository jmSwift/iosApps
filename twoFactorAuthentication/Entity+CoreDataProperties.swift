//
//  Entity+CoreDataProperties.swift
//  twoFactorAuthentication
//
//  Created by Jose on 5/1/16.
//  Copyright © 2016 jose. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entity {

    @NSManaged var email: String?
    @NSManaged var password: String?

}
