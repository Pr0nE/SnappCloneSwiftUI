//
//  OverViewBottomView.swift
//  SwiftUITest
//
//  Created by Mohammad on 6/13/19.
//  Copyright © 2019 Pr0nE. All rights reserved.
//

import SwiftUI

struct OverviewBottomView:View{
    
    var cellViewModel = ServiceCellViewModel()
    
    let xType = UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
    
    let services: [Service] = [Service(id: 1,name: "به صرفه و فوری", imageUrl: "eco", discounted: false),Service(id: 2, name: "ویژه بانوان", imageUrl: "women", discounted: true),Service(id: 3, name: "موتور ویژه مرسولات", imageUrl: "motor1", discounted: false),Service(id: 4, name: "موتور ویژه مسافر", imageUrl: "motor2", discounted: false)]
    
    var body: some View{
        
        
        VStack(spacing: 0){
            Rectangle()
                .fill(Color.white)
                //height*0.26
                .frame(height: 180)
                .overlay(
                    VStack{
                        // no collectionView Alternative Yet, So Going With This Way
                        ScrollView( showsHorizontalIndicator: false, showsVerticalIndicator: false){
                            HStack{
                                ForEach(services.identified(by: \.id)){ service in
                                    
                                    ServiceCell(service: service,cellViewModel : self.cellViewModel)
                                }
                            }
                            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                        
                        
                        HStack{
                            
                            Text("گزینه ها").font(Font.custom("IRANSansWeb", size: 12.6)).color(Color(red: 70/255, green: 179/255, blue: 123/255))
                            
                            Spacer()
                            HStack{
                                Text("ریال").font(Font.custom("IRANSans", size: 13)).color(Color(red: 164/255, green: 164/255, blue: 164/255))
                                Text("۹۵,۰۰۰").font(Font.custom("IRANSansWeb", size: 17)).color(Color.black)
                            }
                            
                            Spacer()
                            Text("کد تخفیف؟").font(Font.custom("IRANSansWeb", size: 12.6)).color(Color(red: 70/255, green: 179/255, blue: 123/255))
                            
                            }.frame(height: 40)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 15))
                    }
            )
            
            Rectangle()
                .fill(Color(red: 25/255, green: 30/255, blue: 49/255))
                // height*0.11
                .frame(height:70)
                .overlay(
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 200)
                        .overlay(Text("درخواست اسنپ اکو")
                            
                            .color(.white)
                            .font(Font.custom("IRANSansWeb", size: 17))
                            .padding(.bottom, 10)
                            
                        )
                        
                        .tapAction {
                            print("Tapped")
                    }
                )
                .edgesIgnoringSafeArea(.bottom)
            }.edgesIgnoringSafeArea(.bottom)
    }
    
}
