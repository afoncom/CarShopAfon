//
//  RentModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

final class RentModule {
    static func build(
        coordinator: GetCarsRentCoordinator
    ) -> RentScreen {
        let viewModel = RentViewModel()
        let presenter = RentPresenterImpl(viewModel: viewModel, coordinator: coordinator)
        
        return RentScreen(viewModel: viewModel, presenter: presenter)
    }
}
