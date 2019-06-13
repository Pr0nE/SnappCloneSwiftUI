//
//  Map.swift
//  SwiftUITest
//
//  Created by Mohammad on 6/11/19.
//  Copyright © 2019 Pr0nE. All rights reserved.
//

import MapKit
import SwiftUI

var originalMapType:MKMapView!

struct ExMap:UIViewRepresentable{
    
    
    func makeUIView(context: Context) -> MKMapView {
        originalMapType = MKMapView()
        // not sure how to access MKMapView type of map in swiftui code, so will access it through static var
        return originalMapType
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {

            // Initial Camera Set
        uiView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 32.6586965, longitude: 51.65804735), latitudinalMeters: CLLocationDistance(exactly: 10000)!, longitudinalMeters: CLLocationDistance(exactly: 10000)!), animated: true)
        
        
        
    }
}
