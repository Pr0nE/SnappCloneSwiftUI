//
//  CustomMarker.swift
//  SwiftUITest
//
//  Created by Mohammad on 6/13/19.
//  Copyright © 2019 Pr0nE. All rights reserved.
//

import SwiftUI
import MapKit


struct CustomLocationMarker:View{
    
    @State var appViewModel:MainViewModel
    
    var body: some View{
        
        ZStack{
            Circle()
                .fill(Color.white)
                .border(Color.black, width: 3, cornerRadius: 50/2)
                .cornerRadius(23)
                .frame(width: 50, height: 50)
            Circle()
                .fill(Color.green)
                .frame(width: 40, height: 40)
            
            Text(appViewModel.currentAppState == .SelectingStart ? "مبدا" : "مقصد")
                
                .color(.white)
                .font(Font.custom("IRANSansWeb", size: appViewModel.currentAppState == .SelectingStart ? 13 : 9))
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fill)
            
            
            
            }
            .tapAction {
                // Location Selected
                
                switch self.appViewModel.currentAppState{
                case .SelectingStart:
                    // save start position
                    
                    let annot = MKPointAnnotation()
                    annot.coordinate = CLLocationCoordinate2D(latitude: originalMapType.centerCoordinate.latitude , longitude: originalMapType.centerCoordinate.longitude)
                    
                    originalMapType.addAnnotation(annot)
                    self.appViewModel.annotations.append(annot)
                    
                    originalMapType.setCenter(CLLocationCoordinate2D(latitude: originalMapType.centerCoordinate.latitude + 0.004  , longitude: originalMapType.centerCoordinate.longitude), animated: true)
                    
                    
                    self.appViewModel.currentAppState = .SelectingFinal
                    
                    
                case .SelectingFinal:
                    
                    // save final position
                    
                    let annot = MKPointAnnotation()
                    annot.coordinate = CLLocationCoordinate2D(latitude: originalMapType.centerCoordinate.latitude , longitude: originalMapType.centerCoordinate.longitude)
                    
                    originalMapType.addAnnotation(annot)
                    self.appViewModel.annotations.append(annot)
                    
                    originalMapType.showAnnotations(self.appViewModel.annotations, animated: true)
                    
                    originalMapType.isUserInteractionEnabled = false
                    
                    self.appViewModel.currentAppState = .OverView
                    
                case .OverView:
                    
                    print("we'll be never in this case")
                    
                }
                
                
                
            }
            .padding(.bottom,-40)
            .background(Rectangle()
                .fill(Color.black)
                .cornerRadius(2)
                .frame(width: 5, height: 29).padding(.top, 103))
        
        
        
        
        
    }
    
}

