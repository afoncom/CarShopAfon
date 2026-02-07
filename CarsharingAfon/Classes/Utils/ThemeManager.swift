//
//  ThemeManager.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI
import Combine

final class ThemeManager: ObservableObject {
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
