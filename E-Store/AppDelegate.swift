//
//  AppDelegate.swift
//  E-Store
//
//  Created by Beks on 30/8/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        window.rootViewController = LoginViewController()
        window.makeKeyAndVisible()
        
        return true
    }
}

