//
//  Landmark.swift
//  onecoach
//
//  Created by Saffan Ahmed on 13/02/2021.
//

import Foundation
import MapKit
import UIKit

struct Landmark {
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
