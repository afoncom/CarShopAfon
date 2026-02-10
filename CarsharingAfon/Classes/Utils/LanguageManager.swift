//
//  LanguageManager.swift
//  CarsharingAfon
//
//  Created by afon.com on 07.02.2026.
//

import Foundation

protocol LanguageManager {
    func getLanguage() -> String
    func setLanguage(_ language: String)
}

final class LanguageManagerImpl {
    
}

extension LanguageManagerImpl: LanguageManager {
    func getLanguage() -> String {
        UserDefaults.standard.string(forKey: "language") ?? "ru"
    }
    
    func setLanguage(_ language: String) {
        UserDefaults.standard.set(language, forKey: "language")
    }
}
