//
//  RentModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

final class RentModule {
    static func build() -> RentScreen {
        let viewModel = RentViewModel()
        let presenter = RentPresenterImpl(viewModel: viewModel)
        
        return RentScreen(viewModel: viewModel, presenter: presenter)
    }
}
