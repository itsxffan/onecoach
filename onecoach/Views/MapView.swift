//
//  MapView.swift
//  onecoach
//
//  Created by Saffan Ahmed on 11/02/2021.
//

import SwiftUI
import MapKit
import UIKit

// This map created will be based on Swift UI element - UIViewRepresentable
struct MapView: UIViewRepresentable {
    
    let landmarks: [Landmark]
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // do nothing
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}


