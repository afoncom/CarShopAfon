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
        let presenter = SettingPresenterImpl(viewModel: viewModel)
        let themeManager = assembly.themeManager
        
        return SettingScreen(viewModel: viewModel, presenter: presenter, themeManager: themeManager)
    }
}
