//
//  Movie+CoreDataProperties.swift
//  MovieStore
//
//  Created by Anton Filipović on 23/06/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var year: String?
    @NSManaged public var genre: String?
    @NSManaged public var directorName: String?
    @NSManaged public var directorSurname: String?
    @NSManaged public var photoURL: String?
    @NSManaged public var summary: String?

}
