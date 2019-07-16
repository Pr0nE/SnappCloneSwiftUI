//
//  LocationHandler.swift
//  SwiftUITest
//
//  Created by Mohammad on 7/16/19.
//  Copyright © 2019 Pr0nE. All rights reserved.
//

import MapKit

//dirty(?) hack for access CLLocationManagerDelegates

class LocationHandler:UIViewController,CLLocationManagerDelegate{
    
    
    lazy var manager:CLLocationManager = {
        let m = CLLocationManager()
        m.delegate = self
        m.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        m.requestAlwaysAuthorization()
        return m
    }()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        manager.stopUpdatingLocation()
         let locValue = locations.last!.coordinate
        
        originalMapType.setCenter(CLLocationCoordinate2D(latitude: locValue.latitude  , longitude: locValue.longitude), animated: true)
        
    }
    
    func getUserLocation(){
        originalMapType.showsUserLocation = true
        manager.startUpdatingLocation()        
        
    }

}

