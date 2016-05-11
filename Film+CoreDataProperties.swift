//
//  Film+CoreDataProperties.swift
//  filmhub
//
//  Created by Javier Angel on 5/9/16.
//  Copyright © 2016 Iohta Group. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Film {

    @NSManaged var image: NSData?
    @NSManaged var movieDescription: String?
    @NSManaged var plot: String?
    @NSManaged var title: String?
    @NSManaged var url: String?

}
