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
    @StateObject private var themeManager = ThemeManager()
    private let appAssembly: AppAssembly
    
    init() {
        let coordinator = AppCoordinator(rootRoute: .welcome)
        _coordinator = StateObject(wrappedValue: coordinator)
        
        let themeManager = ThemeManager()
        _themeManager = StateObject(wrappedValue: themeManager)
        
        let assembly = AppAssemblyImpl()
        self.appAssembly = assembly
        
        let screen = AllCarsModule.build(
            agregator: appAssembly.agregator,
            coordinator: coordinator,
            themeManager: themeManager
        )
    }
    
    var body: some Scene {
        WindowGroup {
            switch coordinator.rootRoute {
            case .welcome:
                WelcomeModule.build(coordinator: coordinator)
            case .main:
                MainTabView(coordinator: coordinator, assembly: appAssembly, themeManager: themeManager)
            }
        }
    }
}
