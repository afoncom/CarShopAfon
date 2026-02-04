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
    
    init() {
        let coordinator = AppCoordinator(rootRoute: .welcome)
        _coordinator = StateObject(wrappedValue: coordinator)
        
        self.assembly = AppAssemblyImpl()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView(coordinator: coordinator, assembly: assembly)
        }
    }
}
