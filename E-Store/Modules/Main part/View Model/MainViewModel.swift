 //
//  MainViewModel.swift
//  E-Store
//
//  Created by Beksultan Maratov on 1/1/23.
//

import Foundation

protocol MainDelegate: AnyObject {
    func showMovie()
}

class MainViewModel {
    
    private weak var delegate: MainDelegate?
    
    init(delegate: MainDelegate){
        self.delegate = delegate
    }
    
    var movies: [MainCellModel] = []
    
    func getAllMovie(){
        
        movies.append(MainCellModel(urlImage: "https://terrigen-cdn-dev.marvel.com/content/prod/1x/avengersendgame_lob_crd_05_2.jpg", name: "qwer"))
        movies.append(MainCellModel(urlImage: "https://static.wikia.nocookie.net/marvels-avengers4475/images/6/63/N7UmKNPcZKKZNb8J1PxPWgsa~2.jpg/revision/latest?cb=20220903204205", name: "Avengers"))
        movies.append(MainCellModel(urlImage: "https://m.media-amazon.com/images/M/MV5BMTM0MjUzNjkwMl5BMl5BanBnXkFtZTcwNjY0OTk1Mw@@._V1_.jpg", name: "Inception"))
    }
    
}
