//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Dilara Elçioğlu on 10.12.2022.
//

import Foundation

class WebService {
    
    func downloadInformations(url: URL, completion: @escaping (RickMorty)->Void){
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                
            }else if let data = data {
                
                    let rickMortyInfo = try? JSONDecoder().decode(RickMorty.self, from: data)
                print(rickMortyInfo?.results ?? "default")
                    if let rickMortyInfo = rickMortyInfo {
                        completion(rickMortyInfo)
                        
                }
            }
        }.resume()
    }
}

