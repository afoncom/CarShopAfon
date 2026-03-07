//
//  SettingsModule.swift
//  CarShopAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

final class SettingsModule {
    static func build(
        settingsAssembly: SettingsAssembly
    ) -> some View {
        let viewModel = SettingsViewModel()
        let settingsRouter = SettingsRouterImpl()
        let presenter = SettingsPresenterImpl(
            viewModel: viewModel,
            themeManager: settingsAssembly.themeManager,
            settingsRouter: settingsRouter,
            mailService: settingsAssembly.mailService
        )
        
        return SettingsScreen(viewModel: viewModel, presenter: presenter)
    }
}
