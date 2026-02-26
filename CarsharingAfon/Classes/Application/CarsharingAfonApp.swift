//
//  CarsharingAfonApp.swift
//  CarsharingAfon
//
//  Created by afon.com on 08.01.2026.
//

import SwiftUI

@main
struct CarsharingAfonApp: App {
    @StateObject private var coordinator: AppCoordinator
    private let assembly: AppAssembly & SettingAssembly
    @State private var languageChanged = false
    
    init() {
        let coordinator = AppCoordinator(rootRoute: .welcome)
        _coordinator = StateObject(wrappedValue: coordinator)
        
        let assembly = AppAssemblyImpl()
        self.assembly = assembly
    }
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch coordinator.rootRoute {
                case .welcome:
                    WelcomeModule.build(coordinator: coordinator)
                case .main:
                    MainTabView(coordinator: coordinator, assembly: assembly)
                }
            }
            .environment(\.languageManager, assembly.languageManager)
            .id(languageChanged)
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name("LanguageChanged"))) { _ in
                languageChanged.toggle()
            }
        }
    }
}
