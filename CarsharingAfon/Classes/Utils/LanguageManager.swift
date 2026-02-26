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
    var currentLanguage: Language { get }
}

final class LanguageManagerImpl: LanguageManager {
    private var _currentLanguage: Language
    
    init() {
        let savedLanguage = UserDefaults.standard.string(forKey: "language")
        if let saved = savedLanguage,
           let language = Language(rawValue: saved) {
            self._currentLanguage = language
        } else {
            self._currentLanguage = .russian
        }
    }
}

extension LanguageManagerImpl {
    func getLanguage() -> String {
        _currentLanguage.rawValue
    }
    
    var currentLanguage: Language {
        _currentLanguage
    }
    
    
    func setLanguage(_ language: String) {
        guard let newLanguage = Language(rawValue: language) else { return }
        
        _currentLanguage = newLanguage
        UserDefaults.standard.set(language, forKey: "language")
    }
    
    
    func bundleForCurrentLanguage() -> Bundle {
        guard let path = Bundle.main.path(forResource: currentLanguage.rawValue, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return Bundle.main
        }
        return bundle
    }
}
