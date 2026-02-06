//
//  SettingPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI
import Combine

protocol SettingPresenter {
    func toggleDarkMode(_ isDark: Bool)
    func setLanguage(_ lang: String)
}

final class SettingPresenterImpl {
    private let themeManager: ThemeManager
    private let viewModel: SettingViewModel
    
    init(
        viewModel: SettingViewModel,
        themeManager: ThemeManager,
    ) {
        self.viewModel = viewModel
        self.themeManager = themeManager
    }
}

extension SettingPresenterImpl: SettingPresenter {
    func toggleDarkMode(_ isDark: Bool) {
        themeManager.isDarkMode = isDark
    }
    
    func setLanguage(_ lang: String) {
        themeManager.language = lang
    }
}
