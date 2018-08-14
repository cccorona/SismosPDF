//
//  Mapa.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 20/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class Mapa: UIViewController, MKMapViewDelegate ,CLLocationManagerDelegate, UIGestureRecognizerDelegate {
   
    @IBOutlet weak var mapviews: MKMapView!
    var boundingRegion : MKCoordinateRegion = MKCoordinateRegion()
    var localSearch : MKLocalSearch!
    var locationManager : CLLocationManager!
    var userCoordinate : CLLocationCoordinate2D!
    var locValue:CLLocationCoordinate2D!
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let fmt = NumberFormatter()
    
    @IBOutlet var CoordenadasSeleccion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.title = strCategory
        self.locationManager = CLLocationManager()
        self.mapviews.delegate = self
        self.mapviews.showsUserLocation = true
        self.mapviews.mapType = MKMapType(rawValue: 0)!
        self.mapviews.userTrackingMode = MKUserTrackingMode(rawValue: 2)!
        if(authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways) {
            locationManager.startUpdatingLocation()
        }
        else
        {
            locationManager.requestWhenInUseAuthorization()
            
        }
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        }
        
        
        // Do any additional setup after loading the view.
        fmt.maximumFractionDigits = 2
        fmt.minimumFractionDigits = 2
        
        
        self.mapviews.userLocation.title = "Mi ubicación"
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        gestureRecognizer.delegate = self
        mapviews.addGestureRecognizer(gestureRecognizer)
        
    }
    
    func handleTap(_ gestureReconizer: UILongPressGestureRecognizer) {
        
        let allAnnotations = self.mapviews.annotations
        self.mapviews.removeAnnotations(allAnnotations)
        
        let location = gestureReconizer.location(in: mapviews)
        let coordinate = mapviews.convert(location,toCoordinateFrom: mapviews)
        
        // Add annotation:
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        latitud = coordinate.latitude.description
        longitud = coordinate.longitude.description
        mapviews.addAnnotation(annotation)
        
        CoordenadasSeleccion.text = "Latitud:" + coordinate.latitude.description + ", Longitud:" + coordinate.longitude.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // let authorizationStatus = CLLocationManager.authorizationStatus()
//        if (authorizationStatus == CLAuthorizationStatus.notDetermined) || (authorizationStatus == nil) || (authorizationStatus == CLAuthorizationStatus.denied )   {
//            locationManager.requestWhenInUseAuthorization()
//            MensajeUbicación()
//
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //        GuardarCotización.isEnabled = false
        
        locationManager.stopUpdatingLocation()
    }
    
    func MensajeUbicación(){
        let ac = UIAlertController(title: "Ficha de inspección", message: "Debe de autorizar el acceso a su ubicación", preferredStyle: .alert )
        let actionYes = UIAlertAction(title: "Configuraciones", style: .default) { (action:UIAlertAction) in
            if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
                UIApplication.shared.openURL(url as URL)
            }
        }
        let actionNo = UIAlertAction(title: "Cancelar", style: .cancel) { (action:UIAlertAction) in
            print("You've pressed No button");
        }
        ac.addAction(actionYes)
        ac.addAction(actionNo)
        present(ac, animated: true)
        
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        //        GuardarCotización.isEnabled = false
//        locationManager.stopUpdatingLocation()
//    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        locValue = manager.location!.coordinate
        self.userCoordinate = CLLocationCoordinate2DMake(locValue.latitude, locValue.longitude)
        self.locationManager.stopUpdatingLocation()
        manager.delegate = nil
        
        let allAnnotations = self.mapviews.annotations
        self.mapviews.removeAnnotations(allAnnotations)
        
        // Add annotation:
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        latitud = locValue.latitude.description
        longitud = locValue.longitude.description
        mapviews.addAnnotation(annotation)
        
        CoordenadasSeleccion.text = "Latitud:" + locValue.latitude.description + ", Longitud:" + locValue.longitude.description
    }
    
    @IBAction func atras(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    @IBAction func VistaAtras(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
