//
//  ViewController.swift
//  mapViewLab
//
//  Created by Sanzhar Kiyassov on 05.02.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var imageName: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var detailName: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var list = List()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageName.image = UIImage(named: list.imageName)
        name.text = list.name
        detailName.text = list.description
        
        
        // _____Метка на координате_____
        // Тут мы задаем координаты для нашей метки
        let lat: CLLocationDegrees = list.latitude
        let long: CLLocationDegrees = list.longitude
        
        // Создаем координату передавая долготу и широту
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        // Создаем метку на карте
        let anotation = MKPointAnnotation()
        
        // Создаем координаты на метке
        anotation.coordinate = location
        
        // Задаем название для нашей метки
        anotation.title = list.name

        // Добавляем метку на карту
        mapView.addAnnotation(anotation)
        
        mapView.setRegion(MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)), animated: true)
        
    }

    @IBAction func touched(_ sender: Any) {
        let mapVC = storyboard?.instantiateViewController(identifier: "detailMapView") as! MapViewController
        
        mapVC.list = list
        navigationController?.show(mapVC, sender: self)
    }
    
}

