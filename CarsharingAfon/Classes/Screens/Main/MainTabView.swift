//
//  MainTabView.swift
//  CarsharingAfon
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
            NavigationStack(path: $coordinator.path) {
                AllCarsModule.build(agregator: assembly.agregator, coordinator: coordinator)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .carDetails(let carId):
                            GetCarsRentModule.build(
                                carId: carId,
                                agregator: assembly.agregator,
                                coordinator: coordinator
                            )
                        case .addCar:
                            AddCarModule.build(agregator: assembly.agregator)
                        case .allCars:
                            AllCarsModule.build(agregator: assembly.agregator, coordinator: coordinator)
                        case .rent:
                            RentModule.build()
                        case .rentComplete:
                            RentCompleteModule.build()
                        }
                    }
            }
            .tabItem {
                Label(L10n.NavigationTitle.allCars, systemImage: "car.side")
            }
            SettingModule.build(settingAssembly: assembly)
                .tabItem {
                    Label(L10n.NavigationTitle.settings, systemImage: "gear")
                }
            VStack {
                Text(L10n.NavigationTitle.account)
                    .foregroundStyle(Color.textDark)
            }
            .tabItem {
                Label(L10n.NavigationTitle.account, systemImage: "person.circle")
            }
        }
    }
}
