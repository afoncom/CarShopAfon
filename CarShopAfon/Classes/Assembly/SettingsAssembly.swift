//
//  SettingsAssembly.swift
//  CarShopAfon

//
//  Created by afon.com on 08.02.2026.
//

protocol SettingsAssembly: AppAssembly {
    var themeManager: ThemeManager { get }
    var languageManager: LanguageManager { get }
    var mailService: MailService { get }
}
