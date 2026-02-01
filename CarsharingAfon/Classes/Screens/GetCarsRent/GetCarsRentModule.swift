//
//  GetCarsRentModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

import SwiftUI

final class GetCarsRentModule {
    static func build(
        carId: String,
        agregator: Agregator,
        coordinator: GetCarsRentCoordinator
    ) -> some View {
        let viewModel = GetCarsRentViewModel(selectedCarId: carId)
        let presenter = GetCarsRentPresenterImpl(
            viewModel: viewModel,
            agregator: agregator,
            coordinator: coordinator
        )
        
        let view = GetCarsRentScreen(
            viewModel: viewModel,
            presenter: presenter
        )
        return view
    }
}
