//
//  SettingViewModel.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import Foundation
import Combine

final class SettingViewModel: ObservableObject {
    @Published var isDarkMode: Bool
    @Published var language: String
    
    init(
        isDarkMode: Bool,
        language: String
    ) {
        self.isDarkMode = isDarkMode
        self.language = language
    }
}
