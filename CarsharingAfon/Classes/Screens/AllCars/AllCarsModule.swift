//
//  AllCarsModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 13.01.2026.
//

import SwiftUI

final class AllCarsModule {
    
    static func build(
        agregator: Agregator,
        coordinator: AppCoordinatorImpl
    ) -> some View {
        let viewModel = AllCarsViewModel()
        let presenter = AllCarsPresenterImpl(
            viewModel: viewModel,
            agregator: agregator,
            coordinator: coordinator
        )
        presenter.loadCars()
        
        let view = AllCarsScreen(viewModel: viewModel, presenter: presenter)
        return view
    }
}
