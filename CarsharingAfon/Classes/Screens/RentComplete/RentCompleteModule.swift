//
//  RentCompleteModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

final class RentCompleteModule {
    static func build(
        coordinator: GetCarsRentCoordinator
    ) -> RentCompleteScreen {
        let viewModel = RentCompleteViewModel()
        let presenter = RentCompletePresenterImpl(viewModel: viewModel, coordinator: coordinator)
        
        return RentCompleteScreen(viewModel: viewModel, presenter: presenter)
    }
}
