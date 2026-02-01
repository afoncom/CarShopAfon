//
//  SettingViewModel.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import Foundation
import Combine

final class SettingViewModel: ObservableObject {
    @Published var themeManager: ThemeManager
    
    init(themeManager: ThemeManager) {
        self.themeManager = themeManager
    }
}
