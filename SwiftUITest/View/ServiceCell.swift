//
//  ServiceCell.swift
//  SwiftUITest
//
//  Created by Mohammad on 6/13/19.
//  Copyright © 2019 Pr0nE. All rights reserved.
//

import SwiftUI

struct ServiceCell:View{
    
    var service:Service
    @State var cellViewModel:ServiceCellViewModel
    
   // lazy var textColor = cellViewModel.selectedServiceId == service.id ? Color.black : Color(red: 164/255, green: 164/255, blue: 164/255)
    
    var body: some View{
        VStack{
            Image(service.imageUrl)
                //.resizable()
                .clipShape(Circle())
                .aspectRatio(contentMode: ContentMode.fit)
                .overlay(
                    Circle()
                        
                        .stroke(cellViewModel.selectedServiceId == service.id ? Color.black : Color(red: 237/255, green: 237/255, blue: 237/255), lineWidth: 2)
                )
                .frame(width: 65,height: 65)
            
            Text(service.name)
            .font(Font.custom("IRANSansWeb", size: 13)).color(cellViewModel.selectedServiceId == service.id ? Color.black : Color(red: 164/255, green: 164/255, blue: 164/255))
            .aspectRatio(contentMode: ContentMode.fill)
            
            }
            .frame(width: 90, height: 110)
            .padding(.trailing, 4)
            .tapAction {
                withAnimation { 
                    self.cellViewModel.selectedServiceId = self.service.id
                }
                
            
        }
        
    }
}
