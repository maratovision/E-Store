//
//  MainViewModel.swift
//  E-Store
//
//  Created by Beksultan Maratov on 1/1/23.
//

import Foundation

protocol MainViewModelProtocol{
    func getPopularMovie(completion: ((PopularMovies) -> Void)?)
}

class MainViewModel: MainViewModelProtocol {
    var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()){
        self.networkManager = networkManager
    }
    
    func getPopularMovie(completion: ((PopularMovies) -> Void)?){
        networkManager.getPopularMovie{ (movies) in
            completion!(movies)
        }
    }
}
