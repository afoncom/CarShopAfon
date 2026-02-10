//
//  SettingViewModel.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import Foundation
import Combine

enum SettingViewState {
    case loading
    case loaded
    case error
}

final class SettingViewModel: ObservableObject {
    @Published var viewState: SettingViewState = .loading
    @Published var isDarkMode: Bool = false
    @Published var language: String = ""
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    
}
