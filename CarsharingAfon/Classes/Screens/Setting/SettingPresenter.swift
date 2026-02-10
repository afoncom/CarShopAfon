//
//  SettingPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI
import Combine

protocol SettingPresenter {
    func load()
    func toggleDarkMode(_ isDark: Bool)
    func setLanguage(_ lang: String)
}

final class SettingPresenterImpl {
    private let viewModel: SettingViewModel
    private let themeManager: ThemeManager
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
    func load() {
        viewModel.isDarkMode = themeManager.isDarkModeEnabled()
        viewModel.language = languageManager.getLanguage()
        viewModel.viewState = .loaded
    }
    
    func toggleDarkMode(_ isDark: Bool) {
        themeManager.setDarkMode(isDark)
    }
    
    func setLanguage(_ lang: String) {
        languageManager.setLanguage(lang)
    }
}
