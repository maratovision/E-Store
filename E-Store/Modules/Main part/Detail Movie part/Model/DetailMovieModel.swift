//
//  DetailMovieModel.swift
//  E-Store
//
//  Created by Neobis on 4/1/23.
//

import Foundation

struct DetailMovieModel: Codable{
    var original_title: String?
    var overview: String?
    var genres: [Genres]?
    var budget: Int?
    var runtime: Int?
    var poster_path: String?
    var release_date: String?
}

struct Genres: Codable{
    var name: String?
}
