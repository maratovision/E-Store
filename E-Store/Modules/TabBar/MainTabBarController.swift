//
//  MainTabBarController.swift
//  E-Store
//
//  Created by Beksultan Maratov on 1/1/23.
//

import UIKit

class MainTabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarAppearance()
        setupViewControllers()
    }
    
    func setupTabBarAppearance(){
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.clipsToBounds = true
        self.tabBar.layer.masksToBounds = false
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -4.0)
        self.tabBar.layer.shadowOpacity = 0.2
        self.tabBar.layer.shadowRadius = 5.0
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    func setupViewControllers(){
        setViewControllers([setupCurrentViewController(.home), setupCurrentViewController(.liveTV), setupCurrentViewController(.profile)], animated: true)
    }
    
    func setupCurrentViewController(_ viewControllerType: ViewControllerType) -> UIViewController{
        let vc = viewControllerType.viewController
        
        vc.tabBarItem.title = viewControllerType.title
        vc.tabBarItem.image = viewControllerType.unSelectedImage
        vc.tabBarItem.selectedImage = viewControllerType.selectedImage
        
        return vc
    }
}
