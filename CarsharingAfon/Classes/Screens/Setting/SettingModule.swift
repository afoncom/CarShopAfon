//
//  SettingModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

final class SettingModule {
    static func build(
        settingAssembly: SettingAssembly
    ) -> some View {
        let viewModel = SettingViewModel()
        let reviewService = ReviewServiceImpl()
        let presenter = SettingPresenterImpl(
            viewModel: viewModel,
            themeManager: settingAssembly.themeManager,
            languageManager: settingAssembly.languageManager,
            reviewService: reviewService
        )
        
        return SettingScreen(viewModel: viewModel, presenter: presenter)
    }
}
