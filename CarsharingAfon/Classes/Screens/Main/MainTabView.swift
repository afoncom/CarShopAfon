//
//  MainTabView.swift
//  CarsharingAfon
//
//  Created by afon.com on 04.02.2026.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject private var coordinator: AppCoordinator
    @StateObject private var themeManager = ThemeManager()
    @State var rootScreen: AllCarsScreen
    let assembly: AppAssembly
    
    init(
        coordinator: AppCoordinator,
        assembly: AppAssembly,
        themeManager: ThemeManager
    ) {
        self.rootScreen = AllCarsModule.build(
            agregator: assembly.agregator,
            coordinator: coordinator,
            themeManager: themeManager
        )
        
        self.coordinator = coordinator
        self.assembly = assembly
    }
    
    var body: some View {
        TabView {
            NavigationStack(path: $coordinator.path) {
                rootScreen
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .carDetails(let carId):
                            GetCarsRentModule.build(carId: carId, agregator: assembly.agregator)
                        case .addCar:
                            AddCarModule.build(agregator: assembly.agregator)
                        case .allCars:
                            AllCarsModule.build(agregator: assembly.agregator, coordinator: coordinator, themeManager: themeManager)
                        case .setting:
                            SettingModule.build(themeManager: themeManager)
                        }
                    }
            }
            .tabItem {
                Label("Все автомобили", systemImage: "car.side")
            }
            
            SettingModule.build(themeManager: themeManager)
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
