//
//  SummaryViewController.swift
//  MovieStore
//
//  Created by Anton Filipović on 16/05/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    @IBOutlet weak var summaryTV: UITextView!
    private var delegate: EditViewControllerDelegate?
    private var summary: String?
    
    convenience init(delegate: EditViewControllerDelegate, summary: String){
        self.init()
        self.delegate = delegate
        self.summary = summary
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summaryTV.text = summary
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(finishEditing))
        self.navigationItem.setLeftBarButton(backButton, animated: true)
    }

    @objc func finishEditing(){
        delegate?.plotEdited(withText: summaryTV.text)
        self.navigationController?.popViewController(animated: true)
    }
}
