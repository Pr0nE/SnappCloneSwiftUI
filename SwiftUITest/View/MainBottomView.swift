//
//  MainBottomView.swift
//  SwiftUITest
//
//  Created by Mohammad on 6/13/19.
//  Copyright © 2019 Pr0nE. All rights reserved.
//

import SwiftUI
import MapKit

struct MainBottomView:View{
    
    @State var appViewModel:MainViewModel
    
    var body: some View{
        
        VStack{
            Spacer()
            VStack(alignment: .trailing){
                //LocationIcon
                ZStack{
                    Circle()
                        
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 2)
                        .frame(width: 45, height: 45)
                    
                    Image("location")
                        
                    .frame(width: 18, height: 18)
                    }.padding(.trailing, 20)
                    .opacity(self.appViewModel.currentAppState == .SelectingStart ? 1 : 0)
                    .tapAction {
                        self.appViewModel.locationManager.getUserLocation()
                    }
                
                // MainBottomView
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .border(Color.gray, width: 0.7, cornerRadius: 23)
                        .cornerRadius(23)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .frame(width: width, height: 100)
                    
                    VStack{
                        Text(self.appViewModel.currentAppState == .SelectingStart ? "۴ اسنپ موجود" : "مبدا:").font(Font.custom("IRANSans", size: 10.5)).fontWeight(.regular)
                            .padding(.bottom,10)
                        CustomDevider()
                        Text(self.appViewModel.currentAppState == .SelectingStart ? "مبدا:" : "مقصد:").font(Font.custom("IRANSans", size: 10.5)).fontWeight(.regular)
                            .padding(.top,6)
                    }
                }
            }
            
            
        }
    }
}



struct CustomDevider:View{
    
    var body: some View{
        
        HStack{
            
            Rectangle().fill(Color.gray)
                .frame(width: width*0.3, height: 1)
            Circle()
                .fill(Color.white)
                .border(Color.green, width: 2, cornerRadius: 7/2)
                
                .frame(width: 7, height: 7)
            
            Rectangle().fill(Color.gray)
                .frame(width: width*0.3, height: 1)
            
        }
        
    }
    
}


