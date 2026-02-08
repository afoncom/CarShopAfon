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
        let themeManager = settingAssembly.themeManager
        let languageManager = settingAssembly.languageManager
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
