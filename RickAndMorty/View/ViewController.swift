//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Dilara Elçioğlu on 9.12.2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        WebService().downloadInformations(url: url) { rmList in
            if let rmList = rmList {
                print(rmList)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RickMortyCell 
        return cell
    }

}

