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
    private let assembly: AppAssembly
    private let settingAssembly: SettingAssembly
    
    init() {
        let coordinator = AppCoordinator(rootRoute: .welcome)
        _coordinator = StateObject(wrappedValue: coordinator)
        
        let assembly = AppAssemblyImpl()
        self.assembly = assembly
        
        self.settingAssembly = assembly as any SettingAssembly
    }
    
    var body: some Scene {
        WindowGroup {
            switch coordinator.rootRoute {
            case .welcome:
                WelcomeModule.build(coordinator: coordinator)
            case .main:
                MainTabView(coordinator: coordinator, assembly: assembly, settingAssembly: settingAssembly)
            }
        }
    }
}
