//
//  LandmarkAnnotation.swift
//  onecoach
//
//  Created by Saffan Ahmed on 13/02/2021.
//

import Foundation
import MapKit
import UIKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
