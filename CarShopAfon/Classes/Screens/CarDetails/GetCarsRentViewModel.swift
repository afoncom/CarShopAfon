//
//  CarDetailsViewModel.swift
//  CarShopAfon
//
//  Created by afon.com on 17.01.2026.
//

import Foundation
import Combine

final class CarDetailsViewModel: ObservableObject {
    @Published var selectedCarId: String
    @Published var selectedCar: RegularCar?
    @Published var viewState: CarDetailsScreen.ViewState = .loading
    
    init(selectedCarId: String, selectedCar: RegularCar? = nil) {
        self.selectedCarId = selectedCarId
        self.selectedCar = selectedCar
    }
}
