//
//  LocationManager.swift
//  onecoach
//
//  Created by Saffan Ahmed on 12/02/2021.
//

import Foundation
import MapKit
import UIKit

// Responsible for getting the users location.
class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    // Anytime location is set to a new value it is going to publish an event.
    @Published var location: CLLocation? = nil
    
    override init() {
        
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Give you a new location everytime location is changed.
        guard let location = locations.last else {
            return
        }
        
        self.location = location
    }
}
