//
//  MainTabView.swift
//  CarShopAfon
//
//  Created by afon.com on 04.02.2026.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject private var coordinator: AppCoordinator
    let assembly: AppAssembly & SettingAssembly
    
    init(
        coordinator: AppCoordinator,
        assembly: AppAssembly & SettingAssembly
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
            
            settingNavigationView
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
    
    var settingNavigationView: some View {
        NavigationView {
            SettingModule.build(settingAssembly: assembly)
        }
    }
    
    var accountNavigationView: some View {
        NavigationView {
            AccountModule.build()
        }
    }
}
