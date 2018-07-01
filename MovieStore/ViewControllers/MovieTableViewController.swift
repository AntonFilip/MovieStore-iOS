//
//  MovieListViewController.swift
//  MovieStore
//
//  Created by Anton Filipović on 18/06/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import UIKit

class MovieTableViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    
    var moviesViewModel: MoviesViewModel!
    let cellReuseIdentifier = "cellReuseIdentifier"
    
    
    convenience init(moviesViewModel: MoviesViewModel){
        self.init()
        self.moviesViewModel = moviesViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
   func setupTableView(){
        movieTableView.backgroundColor = UIColor.lightGray
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.separatorStyle = .none
        movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
    
    }
}

extension MovieTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = MovieTableViewHeader()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieTableView.deselectRow(at: indexPath, animated: true)
        
        if let movie = moviesViewModel.movie(atIndex: indexPath.row) {
            let singleMovieViewModel = SingleMovieViewModel(movie: movie)
            let movieViewController = MovieViewController(movieViewModel: singleMovieViewModel)
            navigationController?.pushViewController(movieViewController, animated: true)
        }
    }
}

extension MovieTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MovieTableViewCell
        
        if let movie = moviesViewModel.movie(atIndex: indexPath.row) {
            cell.setup(withMovie: movie)
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel.numberOfMovies()
    }
}


