//
//  MoviesViewModel.swift
//  MovieStore
//
//  Created by Anton Filipović on 20/06/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import Foundation

class MoviesViewModel{
    
    var movies: [Movie]?
    
    init(){
    }
    
    init(movies: [Movie]){
        self.movies = movies
    }
    
    func movie(atIndex index: Int) -> Movie? {
        guard let movies = movies else {
            return nil
        }
        
        return movies[index]
    }
    
    func numberOfMovies() -> Int {
        return movies?.count ?? 0
    }
}
