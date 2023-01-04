//
//  PopularMovies.swift
//  E-Store
//
//  Created by Neobis on 4/1/23.
//

import Foundation

struct PopularMovies: Codable{
    var results: [PopularMovie]?
}

struct PopularMovie: Codable{
    var id: Int?
    var original_title: String?
    var poster_path: String?
    var overview: String?
}
