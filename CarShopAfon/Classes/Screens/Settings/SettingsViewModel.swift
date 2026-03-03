//
//  SettingsViewModel.swift
//  CarShopAfon
//
//  Created by afon.com on 01.02.2026.
//

import Foundation
import Combine

enum SettingsViewState {
    case loading
    case loaded
    case error
}

final class SettingsViewModel: ObservableObject {
    @Published var viewState: SettingsViewState = .loading
    @Published var isDarkMode: Bool = false
    @Published var language: String = ""
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    
    private let mailService: MailService
    
    init(mailService: MailService) {
        self.mailService = mailService
    }
    
    func canSendMail() -> Bool {
        mailService.canSendMail()
    }
}
