//
//  LanguageManager.swift
//  CarsharingAfon
//
//  Created by afon.com on 07.02.2026.
//

import SwiftUI
import Combine

protocol LanguageManager {
    func getLanguage() -> String
    func setLanguage(_ language: String)
}

final class LanguageManagerImpl: ObservableObject {
    
    @Published var language: String {
        didSet {
            UserDefaults.standard.set(language, forKey: "language")
        }
    }
    
    init() {
        self.language = UserDefaults.standard.string(forKey: "language") ?? "ru"
    }
}

extension LanguageManagerImpl: LanguageManager {
    func getLanguage() -> String {
        language
    }
    
    func setLanguage(_ language: String) {
        self.language = language
    }
}
