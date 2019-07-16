//
//  CustomNavigationBar.swift
//  SwiftUITest
//
//  Created by Mohammad on 6/13/19.
//  Copyright © 2019 Pr0nE. All rights reserved.
//

import SwiftUI

struct CustomNavigationBar:View{
    
    @State var appViewModel:MainViewModel
    
    let topBarHeight:CGFloat = UIScreen.main.bounds.height < 670 ? 70 : 90
    let bottomPadding:CGFloat = UIScreen.main.bounds.height < 670 ? 8 : 0
    
    var body: some View{
        
        
        VStack{
            ZStack{
                VStack{
                    Rectangle()
                        
                        .fill(Color( red: 245/255, green: 245/255, blue: 245/255, opacity: 1))
                        .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 1)
                        .frame(height: topBarHeight)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
                
                VStack{
                    HStack{
                        Rectangle()
                            .opacity(0)
                            .frame(width: 30,height: 30)
                            .overlay(Image( self.appViewModel.currentAppState == .OverView ? "close" : "arrow")
                                .frame(width: 11,height: 19)
                            )
                            .padding(.leading, 17)
                            .tapAction{
                                self.appViewModel.currentAppState = .SelectingStart
                        }
                        
                        Image("magnify").resizable().frame(width: 18,height: 18).padding(.leading, 15).opacity(self.appViewModel.currentAppState == .OverView ? 0 : 1)
                        Spacer()
                        Image("menu").resizable().frame(width: 23,height: 17).padding(.trailing, 26)
                        
                        }
                        .padding(.top, bottomPadding)
                    
                    Spacer()
                }
                
                VStack{
                    Text(self.appViewModel.currentAppState == .SelectingStart ? "کجا هستید؟" : self.appViewModel.currentAppState == .SelectingFinal ? "کجا میروید؟" : "سفر به سلامت")
                        .font(Font.custom("IRANSansWeb", size: 12.6)).fontWeight(.medium)
                        .padding(.top, 5 + bottomPadding)
                    
                    Spacer()
                }
                
            }
            
            Spacer()
            
        }
        
        
    }
}
