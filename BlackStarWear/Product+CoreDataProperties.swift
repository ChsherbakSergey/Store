//
//  Product+CoreDataProperties.swift
//  BlackStarWear
//
//  Created by Sergey on 7/20/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var size: String?
    @NSManaged public var price: String?

}
