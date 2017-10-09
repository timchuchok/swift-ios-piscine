//
//  MapViewController.swift
//  d05
//
//  Created by Vladyslav Tymchenko on 06.10.17.
//  Copyright © 2017 Vladyslav Tymchenko. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol MapViewDelegate {
    func getCity(location: CLLocation)
}

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, MapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = City.cities[0].location
        centerMapOnLocation(location: initialLocation)
        
        addPins()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
    
    func addPins() {
        for city in City.cities {
            let annotation = MKPointAnnotation()
            annotation.coordinate = city.location.coordinate
            annotation.title = city.title
            annotation.subtitle = city.subtitle
            mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        annotationView.canShowCallout = true
        if annotation.title! == "42" {
            annotationView.pinTintColor = UIColor.blue
        } else if annotation.title! == "Kyiv" {
            annotationView.pinTintColor = UIColor.cyan
        }
        else {
            annotationView.pinTintColor = UIColor.red
        }
        return annotationView
    }
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        centerMapOnLocation(location: locations[0])
        mapView.showsUserLocation = true
        print(locations[0])
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    @IBAction func mapModeChanged(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else if segmentedControl.selectedSegmentIndex == 1 {
            mapView.mapType = .satellite
        } else if segmentedControl.selectedSegmentIndex == 2 {
            mapView.mapType = .hybrid
        }
    }
    
    @IBAction func relocateToCurrentPossition(_ sender: Any) {
        self.locationManager.requestLocation()
        print("clicked")
    }
    
    func getCity(location: CLLocation) {
        centerMapOnLocation(location: location)
    }
    
}

