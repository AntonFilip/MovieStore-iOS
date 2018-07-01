//
//  MovieRepository.swift
//  MovieStore
//
//  Created by Anton Filipović on 15/05/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import Foundation

class OfflineMovieRepository: PMovieRepository{
    
    func getAllWhere(name: String, completion: @escaping ((MoviesViewModel?) -> Void)) {
        let resultPredicate = NSPredicate(format: "title contains[c] %@", name)
        if let CDmovies = Movie.all(with: resultPredicate){
            let moviesViewModel = MoviesViewModel(movies: CDmovies as! [Movie])
            completion(moviesViewModel)
            return
        } else {
            completion(nil)
            return
        }
    }
}
