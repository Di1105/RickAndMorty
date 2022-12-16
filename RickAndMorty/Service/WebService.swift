//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Dilara Elçioğlu on 10.12.2022.
//

import Foundation

class WebService {
    
    func downloadInformations(completion: @escaping ((RickMorty)?)->Void){
        
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                
            }else if let data = data {
                
                let rickMortyInfo = try? JSONDecoder().decode(RickMorty.self, from: data)
                //print(rickMortyInfo)
                print("success")

                if let rickMortyInfo = rickMortyInfo {
                        DispatchQueue.main.async {
                            completion(rickMortyInfo)
                        }
                
                }
            }
        }.resume()
    }
}

