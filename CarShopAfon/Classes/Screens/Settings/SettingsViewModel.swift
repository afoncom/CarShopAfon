//
//  SettingsViewModel.swift
//  CarShopAfon
//
//  Created by afon.com on 01.02.2026.
//

import Foundation
import Combine
import SwiftUI

enum SettingsViewState {
    case loading
    case loaded
    case error
}

final class SettingsViewModel: ObservableObject {
    @Published var viewState: SettingsViewState = .loading
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("language") var language: String = ""
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    
}
