//
//  RootView.swift
//  CarsharingAfon
//
//  Created by afon.com on 04.02.2026.
//

import SwiftUI

struct RootView: View {
    var coordinator: AppCoordinator
    let assembly: AppAssembly
    
    var body: some View {
        switch coordinator.rootRoute {
        case .welcome:
            WelcomeModule.build(coordinator: coordinator)
        case .main:
            MainTabView(coordinator: coordinator, assembly: assembly)
        }
    }
}
