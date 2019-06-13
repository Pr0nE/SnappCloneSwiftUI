//
//  ServiceCellViewModel.swift
//  SwiftUITest
//
//  Created by Mohammad on 6/13/19.
//  Copyright © 2019 Pr0nE. All rights reserved.
//

import Foundation


import Combine
import SwiftUI


final class ServiceCellViewModel:BindableObject{
    
    var selectedServiceId:Int = 1{
        didSet{
            didChange.send(self)
        }
    }
    
  
    let didChange = PassthroughSubject<ServiceCellViewModel,Never>()
    
}
