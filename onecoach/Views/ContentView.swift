//
//  ContentView.swift
//  onecoach
//
//  Created by Saffan Ahmed on 11/02/2021.
//

import SwiftUI
import MapKit
import UIKit

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var search: String = ""
    @State private var landmarks: [Landmark] = [Landmark]()
    @State private var tapped: Bool = false
    //@ObservedObject private var locationManager = LocationManager()
    
    private func getNearByLandmarks() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.search
        // e.g. Coffee, Burger, Cafe (Example of Queries)
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark: $0.placemark)
                }
                
            }
            
        }
    }
    
    func calculateOffset() -> CGFloat {
        
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        ZStack(alignment: .top){
            MapView(landmarks: landmarks)
            //.frame(width: 300, height: 300, alignment: .center)
            
            TextField("Search", text: $search, onEditingChanged: { _ in })
            {
                self.getNearByLandmarks()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y: 44)
        }
        
        PlaceListView(landmarks: self.landmarks) {
            // When its tapped this what you need to do:
            self.tapped.toggle()
        }
        .animation(.spring())
        //.offset(y:  calculateOffset())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
