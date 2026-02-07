//
//  RentCompleteModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

final class RentCompleteModule {
    static func build() -> RentCompleteScreen {
        let viewModel = RentCompleteViewModel()
        let presenter = RentCompletePresenterImpl(viewModel: viewModel)
        
        return RentCompleteScreen(viewModel: viewModel, presenter: presenter)
    }
}
