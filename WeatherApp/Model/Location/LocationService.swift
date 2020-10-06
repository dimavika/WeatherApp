//
//  LocationService.swift
//  WeatherApp
//
//  Created by Димас on 06.10.2020.
//

import Foundation
import CoreLocation

final class LocationService: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    var currLongitude = 0.0
    var currLatitude = 0.0
    
    

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currLongitude = location.coordinate.longitude
        currLatitude = location.coordinate.latitude
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
