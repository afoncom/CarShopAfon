//
//  SettingsPresenter.swift
//  CarShopAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI
import Combine

protocol SettingsPresenter {
    func load()
    func toggleDarkMode(_ isDark: Bool)
    func setLanguage(_ lang: String)
    func sendFeedback()
    func requestAppReview()
}

final class SettingsPresenterImpl {
    private let viewModel: SettingsViewModel
    private let themeManager: ThemeManager
    private let languageManager: LanguageManager
    private let settingsRouter: SettingsRouter
    private let mailService: MailService
    
    init(
        viewModel: SettingsViewModel,
        themeManager: ThemeManager,
        languageManager: LanguageManager,
        settingsRouter: SettingsRouter,
        mailService: MailService
    ) {
        self.viewModel = viewModel
        self.themeManager = themeManager
        self.languageManager = languageManager
        self.settingsRouter = settingsRouter
        self.mailService = mailService
    }
}

extension SettingsPresenterImpl: SettingsPresenter {
    func load() {
        viewModel.isDarkMode = themeManager.isDarkModeEnabled()
        viewModel.language = languageManager.getLanguage()
        viewModel.canSendMail = mailService.canSendMail()
        viewModel.viewState = .loaded
    }
    
    func toggleDarkMode(_ isDark: Bool) {
        themeManager.setDarkMode(isDark)
    }
    
    func setLanguage(_ lang: String) {
        languageManager.setLanguage(lang)
    }
    
    func sendFeedback() {
        settingsRouter.sendFeedback()
    }
    
    func requestAppReview() {
        settingsRouter.requestReview()
    }
}
