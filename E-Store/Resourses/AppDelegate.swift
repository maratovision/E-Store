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
        
        if let user = UserDefaults.standard.string(forKey: "login"){
            if user.isEmpty{
                loginApp()
            }
            else{
                mainApp()
            }
        }
        else{
            loginApp()
        }
        
        window.makeKeyAndVisible()
        
        return true
    }
    
    func loginApp(){
        self.window?.rootViewController = navController(vc: LoginViewController())
    }
    
    func mainApp(){ 
        self.window?.rootViewController = navController(vc: MainTabBarController())
    }
    
    func navController(vc: UIViewController) -> UIViewController{
        let viewController = UINavigationController(rootViewController: vc)
        viewController.navigationBar.isHidden = true
        
        return viewController
    
    }
    
}

