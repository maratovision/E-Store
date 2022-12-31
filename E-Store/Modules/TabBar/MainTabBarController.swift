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
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = .lightGray
    }
    
    func setupViewControllers(){
        setViewControllers([setupCurrentViewController(.home), setupCurrentViewController(.profile), setupCurrentViewController(.settings), setupCurrentViewController(.massages)], animated: true)
    }
    
    func setupCurrentViewController(_ viewControllerType: ViewControllerType) -> UIViewController{
        let vc = viewControllerType.viewController
        
        vc.tabBarItem.title = viewControllerType.title
        vc.tabBarItem.image = viewControllerType.unSelectedImage
        vc.tabBarItem.selectedImage = viewControllerType.selectedImage
        
        return vc
    }
}
