//
//  CarDetailsModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

import SwiftUI

final class CarDetailsModule {
    static func build(
        carId: String,
        agregator: Agregator,
        coordinator: GetCarsRentCoordinator
    ) -> some View {
        let viewModel = CarDetailsViewModel(selectedCarId: carId)
        let presenter = CarDetailsPresenterImpl(
            viewModel: viewModel,
            agregator: agregator,
            coordinator: coordinator
        )
        
        let view = CarDetailsScreen(
            viewModel: viewModel,
            presenter: presenter
        )
        return view
    }
}
