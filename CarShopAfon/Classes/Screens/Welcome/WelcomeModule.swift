//
//  WelcomeModule.swift
//  CarShopAfon
//
//  Created by afon.com on 30.01.2026.
//

import SwiftUI

final class WelcomeModule {
    static func build(
        coordinator: WelcomeCoordinator
    ) -> WelcomeScreen {
        let viewModel = WelcomeViewModel()
        let presenter = WelcomePresenterImpl(viewModel: viewModel, coordinator: coordinator)
        
        return WelcomeScreen(viewModel: viewModel, presenter: presenter)
    }
}
