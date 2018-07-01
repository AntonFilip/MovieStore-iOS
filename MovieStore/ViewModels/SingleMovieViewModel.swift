//
//  MovieViewModel.swift
//  MovieStore
//
//  Created by Anton Filipović on 15/05/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import Foundation

class SingleMovieViewModel {
    
    private let movie: Movie
    
    init (movie: Movie){
        self.movie = movie
    }
    
    var title: String{
        return movie.title!
    }
    
    var year: String{
        return movie.year!
    }
    
    var genre: String{
        return movie.genre!
    }
    
    var directorName: String{
        return movie.directorName!
    }
    
    var directorSurname: String{
        return movie.directorSurname!
    }
    
    var photoURL: URL?{
        return URL(string: movie.photoURL!)
    }
    
    var summary: String{
        get {
            return movie.summary!
        }
        set(text) {
            movie.summary = text
        }
    }
}
