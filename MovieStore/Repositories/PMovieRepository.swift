//
//  PMovieRepository.swift
//  MovieStore
//
//  Created by Anton Filipović on 18/06/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import UIKit

protocol PMovieRepository {

    //func getOneWhere(name: String) -> SingleMovieViewModel
    func getAllWhere(name: String, completion: @escaping ((MoviesViewModel?) -> Void)) -> Void
}
