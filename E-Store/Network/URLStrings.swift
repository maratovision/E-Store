//
//  URLStrings.swift
//  E-Store
//
//  Created by Neobis on 4/1/23.
//

import Foundation

enum URLStrings{
    case popularMovies
    case movieByID
    
    var URLString: String{
        switch self {
        case .popularMovies:
            return "\(mainPath)popular?\(apiKey)&page=1"
        case .movieByID:
            return "https://api.themoviedb.org/3/movie/popular?api_key=bfa674e1ba14a3a8771fc7e880b02137"
        }
    }
    
    private var apiKey: String{
        return "api_key=bfa674e1ba14a3a8771fc7e880b02137"
    }
    
    private var mainPath: String{
        return "https://api.themoviedb.org/3/movie/"
    }
}

