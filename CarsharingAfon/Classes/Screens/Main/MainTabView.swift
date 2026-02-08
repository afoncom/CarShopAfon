//
//  MainTabView.swift
//  CarsharingAfon
//
//  Created by afon.com on 04.02.2026.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject private var coordinator: AppCoordinator
    let settingAssembly: SettingAssembly
    let assembly: AppAssembly
    
    init(
        coordinator: AppCoordinator,
        assembly: AppAssembly,
        settingAssembly: SettingAssembly
    ) {
        self.coordinator = coordinator
        self.assembly = assembly
        self.settingAssembly = settingAssembly
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
                Label("Все автомобили", systemImage: "car.side")
            }
            SettingModule.build(settingAssembly: settingAssembly)
                .tabItem {
                    Label("Настройки", systemImage: "gear")
                }
            VStack {
                Text("Аккаунт")
            }
            .tabItem {
                Label("Аккаунт", systemImage: "person.circle")
            }
        }
    }
}
