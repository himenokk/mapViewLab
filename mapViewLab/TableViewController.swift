//
//  TableViewController.swift
//  mapViewLab
//
//  Created by Sanzhar Kiyassov on 05.02.2024.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayOfPlaces = [List(name: "Kaş, Турция", description: "8 гостей; 4 спальни; 5 кроватей; 4,5 ванной", imageName: "1", latitude: 38.99708758308542, longitude: 32.61623073385224), List(name: "Ангра-дос-Рейс, Бразилия", description: "10 гостей; 3 спальни; 8 кроватей; 3 ванные", imageName: "2", latitude: -22.91225424215697, longitude: -44.343638513590875), List(name: "Pererenan, Kec. Mengw, Бали, Индонезия", description: "8 гостей; 4 спальни; 5 кроватей; 5,5 ванной", imageName: "3", latitude: -8.646971418242092, longitude: 115.12587669529253)]
    

    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfPlaces.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let label = cell.viewWithTag(1001) as! UILabel
        label.text = arrayOfPlaces[indexPath.row].name
        
        let labelGenre = cell.viewWithTag(1002) as! UILabel
        labelGenre.text = arrayOfPlaces[indexPath.row].description
        
        let imageview = cell.viewWithTag(1000) as! UIImageView
        imageview.image = UIImage(named: arrayOfPlaces[indexPath.row].imageName)
        

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVc = storyboard?.instantiateViewController(identifier: "detailViewController") as! ViewController
        
        detailVc.list = arrayOfPlaces[indexPath.row]
        
        navigationController?.show(detailVc, sender: self)
    }
    


}
