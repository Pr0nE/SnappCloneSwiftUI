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
    var annotations:[MKAnnotation] = []
    var currentAppState:AppState = .SelectingStart{
        didSet{
            if currentAppState == .SelectingStart{
                originalMapType.removeAnnotations(annotations)
                annotations.removeAll()
                originalMapType.isUserInteractionEnabled = true
                
            }
            didChange.send(self)
        }
    }
    
    
    let didChange = PassthroughSubject<MainViewModel,Never>()
    
}
