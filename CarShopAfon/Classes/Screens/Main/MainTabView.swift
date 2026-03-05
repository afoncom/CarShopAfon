//
//  MainTabView.swift
//  CarShopAfon
//
//  Created by afon.com on 04.02.2026.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject private var coordinator: AppCoordinator
    let assembly: AppAssembly & SettingsAssembly
    
    init(
        coordinator: AppCoordinator,
        assembly: AppAssembly & SettingsAssembly
    ) {
        self.coordinator = coordinator
        self.assembly = assembly
    }
    
    var body: some View {
        TabView {
            
            allCarsNavigationView
                .tabItem {
                    Label(L10n.NavigationTitle.allCars, systemImage: "car.side")
                }
            
            settingsNavigationView
                .tabItem {
                    Label(L10n.NavigationTitle.settings, systemImage: "gear")
                }
            
            accountNavigationView
                .tabItem {
                    Label(L10n.NavigationTitle.account, systemImage: "person.circle")
                }
        }
        .tabViewStyle(.automatic)
    }
}

extension MainTabView {
    var allCarsNavigationView: some View {
        NavigationStack(path: $coordinator.path) {
            AllCarsModule.build(agregator: assembly.agregator, coordinator: coordinator)
                .navigationTitle(L10n.NavigationTitle.allCars)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .carDetails(let carId):
                        CarDetailsModule.build(
                            carId: carId,
                            agregator: assembly.agregator,
                            coordinator: coordinator
                        )
                    case .addCar:
                        AddCarModule.build(agregator: assembly.agregator)
                    case .rent:
                        RentModule.build()
                    case .rentComplete:
                        RentCompleteModule.build()
                    }
                }
        }
    }
    
    var settingsNavigationView: some View {
        NavigationView {
            SettingsModule.build(settingsAssembly: assembly)
                .navigationTitle(L10n.NavigationTitle.settings)
        }
    }
    
    var accountNavigationView: some View {
        NavigationView {
            AccountModule.build()
                .navigationTitle(L10n.NavigationTitle.account)
        }
    }
}
