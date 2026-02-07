//
//  SettingModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

final class SettingModule {
    static func build(
        assembly: AppAssembly
    ) -> some View {
        let themeManager = assembly.themeManager
        let languageManager = assembly.languageManager
        let viewModel = SettingViewModel(
            isDarkMode: themeManager.isDarkMode,
            language: languageManager.language
        )
        let presenter = SettingPresenterImpl(
            viewModel: viewModel,
            themeManager: themeManager,
            languageManager: languageManager
        )
        
        return SettingScreen(viewModel: viewModel, presenter: presenter)
    }
}
