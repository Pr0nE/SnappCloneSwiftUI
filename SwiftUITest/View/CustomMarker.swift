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
                    
                    self.appViewModel.currentAppState = .SelectingFinal
                    
                case .SelectingFinal:
                    
                    self.appViewModel.currentAppState = .OverView
                    
                case .OverView:
                    
                    print("we'll be never in this case")
                    
                }
                
            }
            .padding(.bottom,-40)
            .background(Rectangle()
                .fill(Color.black)
                .cornerRadius(2)
                .frame(width: 5, height: 30).padding(.top, 105))
        
    }
    
}

