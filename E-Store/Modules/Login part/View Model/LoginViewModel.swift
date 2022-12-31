//
//  LoginViewModel.swift
//  E-Store
//
//  Created by Beksultan Maratov on 1/1/23.
//

import Foundation

class LoginViewModel{
    
    private let username: String = "Admin"
    private let password: String = "password"
    
    var isUserAuthorized: ((Bool) -> Void)?
    
    func authorizeUser(login: String, password: String){
        if login.lowercased() == username.lowercased() && password == self.password{
            UserDefaults.standard.setValue("\(login.lowercased())", forKey: "login")
            isUserAuthorized!(true)
        }else{
            isUserAuthorized!(false)
        }
    }
}


