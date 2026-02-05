//
//  SettingPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import Combine

protocol SettingPresenter {
    var themeManager: ThemeManager { get }
}

final class SettingPresenterImpl: ObservableObject {
    @Published var themeManager: ThemeManager
    private let viewModel: SettingViewModel
    
    init(
        viewModel: SettingViewModel,
        themeManager: ThemeManager
    ) {
        self.viewModel = viewModel
        self.themeManager = themeManager
    }
}

extension SettingPresenterImpl: SettingPresenter {

}
