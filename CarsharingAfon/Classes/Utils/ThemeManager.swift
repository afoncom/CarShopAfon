//
//  ThemeManager.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI
import Combine

protocol ThemeManager {
    var isDarkMode: Bool { get set }
    var colorScheme: ColorScheme? { get }
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
    
    var colorScheme: ColorScheme? {
        isDarkMode ? .dark : .light
    }
}

extension ThemeManagerImpl: ThemeManager {
    
}
