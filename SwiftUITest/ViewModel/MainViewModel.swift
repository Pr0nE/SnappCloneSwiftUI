//
//  MainViewModel.swift
//  SwiftUITest
//
//  Created by Mohammad on 6/13/19.
//  Copyright © 2019 Pr0nE. All rights reserved.
//

import Combine
import SwiftUI
import MapKit


final class MainViewModel:BindableObject{
    
    var map = ExMap()
    var locationManager = LocationHandler()
    var annotations:[MKAnnotation] = []
    var currentAppState:AppState = .SelectingStart{
        didSet{
            
            switch currentAppState {
            case .OverView:
                
                // save final position
                
                let annot = MKPointAnnotation()
                annot.coordinate = CLLocationCoordinate2D(latitude: originalMapType.centerCoordinate.latitude , longitude: originalMapType.centerCoordinate.longitude)
                
                originalMapType.addAnnotation(annot)
                annotations.append(annot)
                
                originalMapType.showAnnotations(annotations, animated: true)
                
                originalMapType.isUserInteractionEnabled = false
                
            case .SelectingFinal:
                
                // save start position
                
                let annot = MKPointAnnotation()
                annot.coordinate = CLLocationCoordinate2D(latitude: originalMapType.centerCoordinate.latitude , longitude: originalMapType.centerCoordinate.longitude)
                
                originalMapType.addAnnotation(annot)
                annotations.append(annot)
                
                originalMapType.setCenter(CLLocationCoordinate2D(latitude: originalMapType.centerCoordinate.latitude + 0.004  , longitude: originalMapType.centerCoordinate.longitude), animated: true)
                
            case .SelectingStart:
                
                originalMapType.removeAnnotations(annotations)
                annotations.removeAll()
                originalMapType.isUserInteractionEnabled = true
                
            }
            
            
            didChange.send(self)
        }
    }
    
    
    let didChange = PassthroughSubject<MainViewModel,Never>()
    
}
