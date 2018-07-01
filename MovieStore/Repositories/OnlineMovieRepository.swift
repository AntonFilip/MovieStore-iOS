//
//  OnlineMovieRepository.swift
//  MovieStore
//
//  Created by Anton Filipović on 20/06/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import Foundation
import Alamofire
import AERecord

class OnlineMovieRepository: PMovieRepository{
    let url = "https://www.omdbapi.com/?s="
    let apiKey = "&apikey=a132dc4b"
    
    func getAllWhere(name: String, completion: @escaping ((MoviesViewModel?) -> Void)){
        let url = self.url + name + apiKey
        Alamofire.request(url).validate().responseJSON { response in
            if
                let value = response.result.value as? [String: Any],
                let results = value["Search"] as? [[String: Any]] {
                let movies = results.map({ json -> Movie? in
                    let movie = Movie.createFrom(json: json)
                    return movie
                }).filter { $0 != nil } .map { $0! }
                
                try? AERecord.Context.main.save()
                
                let movieViewModel = MoviesViewModel(movies: movies)
                completion(movieViewModel)
                return
            } else {
                completion(nil)
                return
            }
        }
    }
}
