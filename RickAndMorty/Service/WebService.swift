//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Dilara Elçioğlu on 10.12.2022.
//

import Foundation

class WebService {
    
    func downloadInformations(url: URL, completion: @escaping ([SpeciesRM]?)->Void){
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                do{
                    let ricMort = try JSONSerialization.jsonObject(with: data , options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    DispatchQueue.main.async {
                        print(ricMort)
                        
                        /*let rickMortyList = try? JSONDecoder().decode([SpeciesRM].self, from: data)
                         print(rickMortyList ?? "Error1234")
                         if let rickMortyList = rickMortyList {
                         completion(rickMortyList)*/
                    }
                } catch{
                    print("data yok")
                }
            }
        }.resume()
    }
}

