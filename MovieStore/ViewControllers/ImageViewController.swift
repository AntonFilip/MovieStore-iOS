//
//  ImageViewController.swift
//  MovieStore
//
//  Created by Anton Filipović on 15/05/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var movieImage: UIImage!
    
    convenience init(movieImage: UIImage){
        self.init()
        self.movieImage = movieImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        imageView.image = movieImage
        scrollView.contentSize = movieImage.size
        //let point = CGPoint(x: imageView.frame.width/2 - movieImage.size.width/2, y: imageView.frame.height/2 - movieImage.size.height/2)
        //scrollView.contentOffset = point
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView?{
        return self.imageView
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat){
        scrollView.contentSize = CGSize(width: movieImage.size.width * scale, height: movieImage.size.height * scale)
        
    }
}
