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
        let viewModel = SettingViewModel()
        let presenter = SettingPresenterImpl(
            viewModel: viewModel,
            themeManager: assembly.themeManager,
            languageManager: assembly.languageManager
        )
        
        return SettingScreen(viewModel: viewModel, presenter: presenter)
    }
}
