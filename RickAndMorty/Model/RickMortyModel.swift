//
//  RickMortyModel.swift
//  RickAndMorty
//
//  Created by Dilara Elçioğlu on 10.12.2022.
//

import Foundation
// MARK: - RickMorty
struct RickMorty : Decodable{
    let results: [ResultsRM]
}

// MARK: - Result
struct ResultsRM: Decodable {
    let id: Int
    let name: String
    let species: String
    let origin, location: Location
    let image: String
}

// MARK: - Location
struct Location: Decodable {
    let name: String
}
