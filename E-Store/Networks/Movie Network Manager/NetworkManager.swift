//
//  NetworkManager.swift
//  E-Store
//
//  Created by Neobis on 4/1/23.
//

import Foundation

protocol NetworkManagerProtocol{
    func getPopularMovie(completion: ((PopularMovies) -> Void)?)
    func getImage(endPath: String) -> String
    func getDetailData(id: Int, completion: ((DetailMovieModel) -> Void)?)
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
    
    func getDetailData(id: Int, completion: ((DetailMovieModel) -> Void)?){
        let url = URL(string: URLStrings.movieByID(id: id ).URLString)
        if let url = url {
            urlSession.dataTask(with: url) {(data, response, error) in
                if let data = data {
                    if let movieData = self.parseDetailMovieJSON(data: data){
                        completion!(movieData)
                    }
                }
            }.resume()
        }
    }
}

extension NetworkManager{
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
    
    private func parseDetailMovieJSON(data: Data) -> DetailMovieModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(DetailMovieModel.self, from: data)
            return decodedData
        }
        catch{
            return nil
        }
    }
}

extension NetworkManager{
    
    func getImage(endPath: String) -> String{
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(endPath)")
        let answer = "https://image.tmdb.org/t/p/w500\(endPath)"
        if let url = url {
            urlSession.dataTask(with: url) {(data, response, error) in
            }.resume()
        }
        return answer
    }
}

private extension Data {
    var prettyPrintedJSONString: String { /// NSString gives us a nice sanitized debugDescription
        guard
            let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        else { return "" }
        return prettyPrintedString as String
    }
}
