//
//  SettingPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI
import Combine

protocol SettingPresenter {
    func toggleDarkMode()
    func setLanguage(_ lang: String)
    var colorScheme: ColorScheme? { get }
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
    var colorScheme: ColorScheme? {
        themeManager.isDarkMode ? .dark : .light
    }
}

extension SettingPresenterImpl: SettingPresenter {
    func toggleDarkMode() {
        themeManager.isDarkMode.toggle()
    }
    
    func setLanguage(_ lang: String) {
        themeManager.language = lang
    }
}
