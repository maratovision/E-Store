//
//  ViewControllerType.swift
//  E-Store
//
//  Created by Beksultan Maratov on 1/1/23.
//

import UIKit

enum ViewControllerType{
    case home
    case liveTV
    case profile
    
    
    var viewController: UIViewController{
        switch self {
        case .home:
            return MainViewController(viewModel: MainViewModel())
        case .liveTV:
            return SettingsViewController()
        case .profile:
            return ProfileViewController()
        }
    }
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .liveTV:
            return "Live TV"
        case .profile:
            return "User"
        }
    }
    
    var selectedImage: UIImage{
        switch self {
        case .home:
            return UIImage(named: "Home")?.withTintColor(.purple) ?? UIImage()
        case .liveTV:
            return UIImage(named: "Display")?.withTintColor(.purple) ?? UIImage()
        case .profile:
            return UIImage(named: "User")?.withTintColor(.purple) ?? UIImage()
        }
    }
    
    var unSelectedImage: UIImage{
        switch self {
        case .home:
            return UIImage(named: "Home")?.withTintColor(.black) ?? UIImage()
        case .liveTV:
            return UIImage(named: "Display")?.withTintColor(.black) ?? UIImage()
        case .profile:
            return UIImage(named: "User")?.withTintColor(.black) ?? UIImage()
        }
    }
}
