//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Mohammad on 6/11/19.
//  Copyright © 2019 Pr0nE. All rights reserved.
//

import SwiftUI
import Combine


struct MainView : View {
    
    @State var appViewModel:MainViewModel = MainViewModel()
    
    var body: some View {
        
        VStack{
            
            ZStack{
                
                appViewModel.map
                    .edgesIgnoringSafeArea(.all)
                    .padding(.top,40)
                CustomNavigationBar(appViewModel: appViewModel)
                MainBottomView(appViewModel: appViewModel).opacity(appViewModel.currentAppState == .OverView ? 0 : 1)
                CustomLocationMarker(appViewModel: appViewModel)
                    // centering Bottom Of Marker:
                    .padding(.bottom, 100)
                    .opacity(appViewModel.currentAppState == .OverView ? 0 : 1)
                
            }
            if appViewModel.currentAppState == .OverView{
                OverviewBottomView()
            }
            }.edgesIgnoringSafeArea(appViewModel.currentAppState == .OverView ? .bottom : .trailing)
        
    }
}









