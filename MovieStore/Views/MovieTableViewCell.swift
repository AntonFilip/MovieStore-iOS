//
//  MovieTableViewCell.swift
//  MovieStore
//
//  Created by Anton Filipović on 20/06/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = UIColor.brown
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = UIColor.gray
        descriptionLabel.numberOfLines = 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        timeLabel.text = ""
        descriptionLabel.text = ""
        //        reviewImageView?.image = nil
    }
    
    func setup(withMovie movie: Movie) {
        titleLabel.text = movie.title
        timeLabel.text = movie.year
        descriptionLabel.text = movie.summary
        
        let url = URL(string: movie.photoURL!)
        movieImageView.kf.setImage(with: url)
    }
}
