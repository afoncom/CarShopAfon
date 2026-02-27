//
//  CarShopAfonApp.swift
//  CarShopAfon
//
//  Created by afon.com on 08.01.2026.
//

import SwiftUI

@main
struct CarShopAfonApp: App {
    @StateObject private var coordinator: AppCoordinator
    private let assembly: AppAssembly & SettingsAssembly
    
    init() {
        let coordinator = AppCoordinator(rootRoute: .welcome)
        _coordinator = StateObject(wrappedValue: coordinator)
        
        let assembly = AppAssemblyImpl()
        self.assembly = assembly
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.appBackground
                    .ignoresSafeArea()
                
                switch coordinator.rootRoute {
                case .welcome:
                    WelcomeModule.build(coordinator: coordinator)
                case .main:
                    MainTabView(coordinator: coordinator, assembly: assembly)
                }
            }
        }
    }
}
