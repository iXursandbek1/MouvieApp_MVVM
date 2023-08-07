//
//  APICaller.swift
//  MouvieApp_MVVM
//
//  Created by Xursandbek Qambaraliyev on 05/08/23.
//

import Foundation

enum NetworkError: Error {
    
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMouvies(
        completionHandler: @escaping (_ result: Result<TrendingMouvieModel,NetworkError>)
        -> Void ) {
            
            let urlString = NetworkConstant.shared.serverAddress +
            "trending/all/day?api_key=" +
            NetworkConstant.shared.apiKey
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataRespons, urlRespons, error in
                
                if error == nil,
                    let data = dataRespons,
                   let resultData = try? JSONDecoder().decode(TrendingMouvieModel.self, from: data) {
                    
                    completionHandler(.success(resultData))
                } else {
                    completionHandler(.failure(.canNotParseData))
                }
                
            }.resume()
        }
}
