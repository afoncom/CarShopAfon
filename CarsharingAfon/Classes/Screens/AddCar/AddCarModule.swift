//
//  AddCarModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 25.01.2026.
//

import SwiftUI

final class AddCarModule {
    
    static func build(
        agregator: Agregator
    ) -> some View {
        let viewModel = AddCarViewModel()
        let presenter = AddCarPresenterImpl(
            viewModel: viewModel,
            agregator: agregator
        )
        
        let view = AddCarScreen(viewModel: viewModel, presenter: presenter)
        return view
    }
}
