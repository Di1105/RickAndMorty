//
//  RickMortyModel.swift
//  RickAndMorty
//
//  Created by Dilara Elçioğlu on 10.12.2022.
//

import Foundation

struct SpeciesRM: Decodable {
    var id : Int
    var name : String
    var species : String
    var origin : OriginName
    var location : RMImage
}
struct OriginName: Decodable {
    var name : String
}

struct RMImage: Decodable {
    var image : Data
}
