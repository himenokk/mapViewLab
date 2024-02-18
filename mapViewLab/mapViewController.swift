

import Foundation

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapViewDetail: MKMapView!
    
    var list = List()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let lat: CLLocationDegrees = 51.15215920153921
        let long: CLLocationDegrees = 71.41915022773804
        
        // Создаем координату передавая долготу и широту
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        // Создаем метку на карте
        let anotation = MKPointAnnotation()
        
        // Создаем координаты на метке
        anotation.coordinate = location
        
        // Задаем название для нашей метки
        anotation.title = "Моя локация"

        // Задаем описание для нашей метки
        // anotation.subtitle = "Something"
        
        // Добавляем метку на карту
        mapViewDetail.addAnnotation(anotation)
        
        
        
        
        
        
        
        // _____Метка на координате_____
        // Тут мы задаем координаты для нашей метки
        let lat1: CLLocationDegrees = list.latitude
        let long1: CLLocationDegrees = list.longitude
        
        // Создаем координату передавая долготу и широту
        let location1: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat1, long1)
        
        // Создаем метку на карте
        let anotation1 = MKPointAnnotation()
        
        // Создаем координаты на метке
        anotation1.coordinate = location1
        
        // Задаем название для нашей метки
        anotation1.title = list.name

        // Задаем описание для нашей метки
        // anotation.subtitle = "Something"
        
        // Добавляем метку на карту
        mapViewDetail.addAnnotation(anotation1)
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: (location1.latitude + location.latitude) / 2,
                longitude: (location1.longitude + location.longitude) / 2
            ),
            span: MKCoordinateSpan(
                latitudeDelta: abs(location1.latitude - location.latitude) * 1.5,
                longitudeDelta: abs(location1.longitude - location.longitude) * 1.5
            )
        )

        // Устанавливаем регион на карту
        mapViewDetail.setRegion(region, animated: true)
        
        
      
    }
    
    
    
    
    

}

