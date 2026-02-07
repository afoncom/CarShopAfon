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
    private let languageManager: LanguageManager
    
    init(
        viewModel: SettingViewModel,
        themeManager: ThemeManager,
        languageManager: LanguageManager
    ) {
        self.viewModel = viewModel
        self.themeManager = themeManager
        self.languageManager = languageManager
    }
}

extension SettingPresenterImpl: SettingPresenter {
    func toggleDarkMode(_ isDark: Bool) {
        themeManager.isDarkMode = isDark
    }
    
    func setLanguage(_ lang: String) {
        languageManager.language = lang
    }
}
