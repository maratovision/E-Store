//
//  NetworkManager.swift
//  E-Store
//
//  Created by Neobis on 4/1/23.
//

import Foundation

protocol NetworkManagerProtocol{
    func getPopularMovie(completion: ((PopularMovies) -> Void)?)
}

class NetworkManager: NetworkManagerProtocol{
    
    let urlSession = URLSession.shared
    
    func getPopularMovie(completion: ((PopularMovies) -> Void)?){
        let url = URL(string: URLStrings.popularMovies.URLString)
        
        if let url = url {
            urlSession.dataTask(with: url) {(data, response, error) in
                if let data = data {
                    if let movies = self.parseJSON(data: data){
                        completion!(movies)
                    }
                }
            }.resume()
        }
    }
    
    private func parseJSON(data: Data) -> PopularMovies?{
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(PopularMovies.self, from: data)
            return decodedData
        }
        catch{
            return nil
        }
    }
}
