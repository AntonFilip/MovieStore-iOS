//
//  LoginViewController.swift
//  MovieStore
//
//  Created by Anton Filipović on 29/06/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var appNameLbl: UILabel!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appNameLbl.text = "Movie Store"
        self.appNameLbl.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        self.appNameLbl.alpha = 0
        
        let usernameTFPositionX = self.usernameTF.frame.origin.x
        self.usernameTF.transform = CGAffineTransform(translationX: -1*usernameTFPositionX, y: 0.0)
        self.usernameTF.alpha = 0
        
        let passwordTFPositionX = self.passwordTF.frame.origin.x
        self.passwordTF.transform = CGAffineTransform(translationX: -1*passwordTFPositionX, y: 0.0)
        self.passwordTF.alpha = 0
        
        let loginBtnPositionX = self.loginBtn.frame.origin.x
        self.loginBtn.transform = CGAffineTransform(translationX: -1*loginBtnPositionX, y: 0.0)
        self.loginBtn.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animateEverythingIn()
    }

    func animateEverythingIn(){
        UIView.animate(withDuration: 0.6, animations: {
            self.appNameLbl.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.appNameLbl.alpha = 1.0
        }){ _ in
        }
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.usernameTF.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
            self.usernameTF.alpha = 1.0
        }){ _ in
        }
        UIView.animate(withDuration: 0.6, delay: 0.3, options: .curveEaseOut, animations: {
            self.passwordTF.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
            self.passwordTF.alpha = 1.0
        }){ _ in
        }
        UIView.animate(withDuration: 0.6, delay: 0.45, options: .curveEaseOut, animations: {
            self.loginBtn.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
            self.loginBtn.alpha = 1.0
        }){ _ in
        }
    }
    
    func animateEverythingOut(){
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            let appNameLblPositionX = self.appNameLbl.frame.origin.x
            self.appNameLbl.transform = CGAffineTransform(translationX: 0.0, y: -1*appNameLblPositionX)
            self.appNameLbl.alpha = 0
        }){ _ in
        }
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            let usernameTFPositionX = self.usernameTF.frame.origin.x
            self.usernameTF.transform = CGAffineTransform(translationX: 0.0, y: -1*usernameTFPositionX)
            self.usernameTF.alpha = 0
        }){ _ in
        }
        UIView.animate(withDuration: 0.6, delay: 0.3, options: .curveEaseOut, animations: {
            let passwordTFPositionX = self.passwordTF.frame.origin.x
            self.passwordTF.transform = CGAffineTransform(translationX: 0.0, y: -1*passwordTFPositionX)
            self.passwordTF.alpha = 0
        }){ _ in
        }
        UIView.animate(withDuration: 0.6, delay: 0.45, options: .curveEaseOut, animations: {
            let loginBtnPositionX = self.loginBtn.frame.origin.x
            self.loginBtn.transform = CGAffineTransform(translationX: 0.0, y: -1*loginBtnPositionX)
            self.loginBtn.alpha = 0
        }){ _ in
            let searchVC = SearchViewController(movieRepository: OnlineMovieRepository())
            let nvc = UINavigationController(rootViewController: searchVC)
            nvc.navigationBar.isTranslucent = false
            self.present(nvc, animated: true, completion: {return})
        }
    }
    
    @IBAction func loginButtonTap(_ sender: UIButton) {
        animateEverythingOut()
    }
    

}
