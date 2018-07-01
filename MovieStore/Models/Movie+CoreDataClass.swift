//
//  Movie+CoreDataClass.swift
//  MovieStore
//
//  Created by Anton Filipović on 23/06/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Movie)
public class Movie: NSManagedObject {

    class func createFrom(json: [String: Any]) -> Movie? {
        if
            let title = json["Title"] as? String,
            let year = json["Year"] as? String,
            let photoURL = json["Poster"] as? String {
            
            let movie = Movie.firstOrCreate(with: ["title": title])
            movie.title = title
            movie.year = year
            movie.genre = "Comedy"
            movie.directorName = "NoName"
            movie.directorSurname = "NoSurname"
            movie.photoURL = photoURL
            if (movie.summary == nil){
                movie.summary = "No summary"
            }
            return movie
        }
        return nil
    }
}
