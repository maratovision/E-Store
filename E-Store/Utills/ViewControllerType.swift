//
//  ViewControllerType.swift
//  E-Store
//
//  Created by Beksultan Maratov on 1/1/23.
//

import UIKit

enum ViewControllerType{
    case home
    case profile
    case settings
    case massages
    
    var viewController: UIViewController{
        switch self {
        case .home:
            return MainViewController(viewModel: MainViewModel())
        case .profile:
            return ProfileViewController()
        case .settings:
            return SettingsViewController()
        case .massages:
            return MassegesViewController()
        }
    }
    
    var title: String{
        switch self {
        case .home:
            return "home"
        case .profile:
            return "profile"
        case .settings:
            return "settings"
        case .massages:
            return "massages"
        }
    }
    
    var selectedImage: UIImage{
        switch self {
        case .home:
            return UIImage(named: "home_icon")?.withTintColor(.blue) ?? UIImage()
        case .profile:
            return UIImage(named: "settings_icon")?.withTintColor(.blue) ?? UIImage()
        case .settings:
            return UIImage(named: "settings_icon")?.withTintColor(.blue) ?? UIImage()
        case .massages:
            return UIImage(named: "home_icon")?.withTintColor(.blue)  ?? UIImage()
        }
    }
    
    var unSelectedImage: UIImage{
        switch self {
        case .home:
            return UIImage(named: "home_icon")?.withTintColor(.white) ?? UIImage()
        case .profile:
            return UIImage(named: "settings_icon")?.withTintColor(.white) ?? UIImage()
        case .settings:
            return UIImage(named: "settings_icon")?.withTintColor(.white) ?? UIImage()
        case .massages:
            return UIImage(named: "home_icon")?.withTintColor(.white)  ?? UIImage()
        }
    }
}
