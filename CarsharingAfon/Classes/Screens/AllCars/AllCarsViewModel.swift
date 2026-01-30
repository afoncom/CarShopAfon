//
//  AllCarsViewModel.swift
//  CarsharingAfon
//
//  Created by afon.com on 13.01.2026.
//

import Foundation
import Combine

final class AllCarsViewModel: ObservableObject {
    @Published var allCars: [RegularCar] = []
    @Published var triggerAlert = false
    @Published var viewState: AllCarsScreen.ViewState = .loading
    
}
