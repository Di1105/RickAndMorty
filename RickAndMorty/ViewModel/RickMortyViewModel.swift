//
//  RMViewModel.swift
//  RickAndMorty
//
//  Created by Dilara Elçioğlu on 14.12.2022.
//

import Foundation
import UIKit

struct RickMortyListVM {
    let rickMortyListVM : RickMorty
    
    func numberOfRows() -> Int {
        return self.rickMortyListVM.results.count
    }
    
    func rickMortyatIndex(_ index : Int) -> RickMortyVM {
        let rickMorty = self.rickMortyListVM.results[index]
        return RickMortyVM(rickMortyVM: rickMorty)
    }
    
    
}

struct RickMortyVM {
    
    let rickMortyVM : ResultsRM
    var name : String {
        return self.rickMortyVM.name
    }
    /*var image : String {
        return self.rickMortyVM.image
    }*/
    
    
}
