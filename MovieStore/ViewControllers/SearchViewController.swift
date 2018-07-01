//
//  SearchViewController.swift
//  MovieStore
//
//  Created by Anton Filipović on 07/05/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    let reachability = Reachability()!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var noMoviesFoundLabel: UILabel!
    
    private var movieRepository: PMovieRepository!
    private var movieRepositoryHolder: PMovieRepository!
    
    convenience init(movieRepository: PMovieRepository){
        self.init()
        self.movieRepositoryHolder = movieRepository
        
        reachability.whenReachable = { reachability in
            //sometimes this callback is not triggered
            //also ask how to handle enums in CoreData
            self.movieRepository = self.movieRepositoryHolder
        }
        reachability.whenUnreachable = { _ in
            self.movieRepository = OfflineMovieRepository()
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTF.placeholder = "Movie name"
        searchTF.delegate = self
        self.navigationItem.title = "Movie search"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        movieRepository.getAllWhere(name: textField.text!){ (moviesViewModel) in
            if let moviesVM = moviesViewModel {
                self.noMoviesFoundLabel.text = ""
                let movieListVC = MovieTableViewController(moviesViewModel: moviesVM)
                self.navigationController?.pushViewController(movieListVC, animated: true)
            } else {
                self.noMoviesFoundLabel.text = "No movies found, try again."
            }
        }
        textField.text = ""
        return true
    }
}

//let movieViewModel = MovieViewModel(movie: movieRepository.getOneWhere(name: textField.text!))
//let movieViewController = MovieViewController(movieViewModel: movieViewModel)
//self.navigationController?.pushViewController(movieViewController, animated: true)
