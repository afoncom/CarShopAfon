//
//  SettingAssembly.swift
//  CarsharingAfon
//
//  Created by afon.com on 08.02.2026.
//

protocol SettingAssembly: AppAssembly {
    var themeManager: ThemeManager { get }
    var languageManager: LanguageManager { get }
    var mailRouter: MailRouter { get }
}
