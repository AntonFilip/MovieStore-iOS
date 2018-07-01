//
//  AppDelegate.swift
//  MovieStore
//
//  Created by Anton Filipović on 07/05/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import UIKit
import AERecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        try? AERecord.loadCoreDataStack()
        
        let loginVC = LoginViewController()
        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()
        return true
    }

}

