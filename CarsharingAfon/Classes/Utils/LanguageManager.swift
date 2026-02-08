//
//  LanguageManager.swift
//  CarsharingAfon
//
//  Created by afon.com on 07.02.2026.
//

import SwiftUI
import Combine

protocol LanguageManager {
    var language: String { get set }
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
    
}
