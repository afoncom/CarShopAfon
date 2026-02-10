//
//  ThemeManager.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import Foundation

protocol ThemeManager {
    func isDarkModeEnabled() -> Bool
    func setDarkMode(_ enabled: Bool)
}

final class ThemeManagerImpl {
 
}

extension ThemeManagerImpl: ThemeManager {
    func isDarkModeEnabled() -> Bool {
        UserDefaults.standard.bool(forKey: "isDarkMode")
    }
    
    func setDarkMode(_ enabled: Bool) {
        UserDefaults.standard.set(enabled, forKey: "isDarkMode")
    }
}
