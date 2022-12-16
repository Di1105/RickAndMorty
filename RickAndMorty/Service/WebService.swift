//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Dilara Elçioğlu on 10.12.2022.
//

import Foundation
import UIKit

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
    
    func downloadImage(url: String, completion: @escaping ((UIImage)?)->Void){

            let url = URL(string: url)!
            URLSession.shared.dataTask(with: url) { data, response, error in

                if let error = error {
                    print(error.localizedDescription)

                }else if let data = data {

                    let image = UIImage(data: data)

                    DispatchQueue.main.async {
                        completion(image)
                    }
                }
            }.resume()
        }
}

