//
//  SettingModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

final class SettingModule {
    static func build() -> some View {
        let viewModel = SettingViewModel()
        let presenter = SettingPresenterImpl(viewModel: viewModel)
        
        return SettingScreen(viewModel: viewModel, presenter: presenter)
    }
}
