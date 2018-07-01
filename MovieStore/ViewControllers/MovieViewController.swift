//
//  MovieViewController.swift
//  MovieStore
//
//  Created by Anton Filipović on 11/05/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import UIKit
import Kingfisher
import AERecord

class MovieViewController: UIViewController, EditViewControllerDelegate {

    @IBOutlet weak var movieImageIV: UIImageView!
    @IBOutlet weak var movieTitleLb: UILabel!
    @IBOutlet weak var yearLb: UILabel!
    @IBOutlet weak var genreLb: UILabel!
    @IBOutlet weak var directorLb: UILabel!
    @IBOutlet weak var summaryTV: UITextView!
    private var movieViewModel: SingleMovieViewModel!
    
    convenience init(movieViewModel: SingleMovieViewModel){
        self.init()
        self.movieViewModel = movieViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "circled-left"), style: .plain, target: self, action: #selector(popVCStack))
        
        self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
        let rightBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(pushSummaryToStack))
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)
        
        movieTitleLb.text = movieViewModel.title
        yearLb.text = String(movieViewModel.year)
        genreLb.text = movieViewModel.genre
        directorLb.text = movieViewModel.directorName + " " + movieViewModel.directorSurname
        summaryTV.text = movieViewModel.summary
        movieImageIV.kf.setImage(with: movieViewModel.photoURL)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        movieImageIV.addGestureRecognizer(tapRecognizer)
        
    }

    @objc func popVCStack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func pushSummaryToStack() {
        self.navigationController?.pushViewController(SummaryViewController(delegate: self, summary: movieViewModel.summary), animated: true)
    }
    
    @objc func handleTap() {
        let imageVC = ImageViewController(movieImage: movieImageIV.image!)
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
    
    func plotEdited(withText text: String) {
        movieViewModel.summary = text
        summaryTV.text = movieViewModel.summary
        try?AERecord.Context.main.save()
    }
    
    
}
