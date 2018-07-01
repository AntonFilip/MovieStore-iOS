//
//  MoviesTableViewHeader.swift
//  MovieStore
//
//  Created by Anton Filipović on 20/06/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import UIKit
import PureLayout

class MovieTableViewHeader: UIView{
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.lightGray
        titleLabel = UILabel()
        titleLabel.text = "Results for entered movie:"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = UIColor.darkGray
        self.addSubview(titleLabel)
        titleLabel.autoPinEdge(.top, to: .top, of: self, withOffset: 16.0)
        titleLabel.autoAlignAxis(.vertical, toSameAxisOf: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
