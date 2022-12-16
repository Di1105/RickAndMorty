//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Dilara Elçioğlu on 9.12.2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    private var rickMortyListVM : RickMortyListVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImage.image = UIImage(named: "rmm")
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        getData()
    }
    
    func getData(){
        WebService().downloadInformations { rmList in
            if let rmList = rmList{
                print(rmList)
                self.rickMortyListVM = RickMortyListVM(rickMortyListVM: rmList)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rickMortyListVM == nil ? 0 : self.rickMortyListVM.numberOfRows()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RickMortyCell
            let rickMortyVM = rickMortyListVM.rickMortyatIndex(indexPath.row)
            cell.nameLabel.text = rickMortyVM.name
            cell.rmImageView.layer.cornerRadius = cell.rmImageView.frame.height / 2
            cell.rickMortyView.layer.cornerRadius = cell.rickMortyView.frame.height / 2
            WebService().downloadImage(url: rickMortyVM.image) { image in
                cell.rmImageView.image = image
            }
            return cell
        }

}

