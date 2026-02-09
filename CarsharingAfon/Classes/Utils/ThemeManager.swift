//
//  ThemeManager.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI
import Combine

protocol ThemeManager {
    func isDarkModeEnabled() -> Bool
    func setDarkMode(_ enabled: Bool)
}

final class ThemeManagerImpl: ObservableObject {
    @Published var isDarkMode: Bool {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        }
    }
    
    init() {
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
    }
    
    private var colorScheme: ColorScheme? {
        isDarkMode ? .dark : .light
    }
}

extension ThemeManagerImpl: ThemeManager {
    func isDarkModeEnabled() -> Bool {
        isDarkMode
    }
    
    func setDarkMode(_ enabled: Bool) {
        isDarkMode = enabled
    }
}
