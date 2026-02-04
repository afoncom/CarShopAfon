//
//  MainTabView.swift
//  CarsharingAfon
//
//  Created by afon.com on 04.02.2026.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject private var coordinator: AppCoordinator
    @State var rootScreen: AllCarsScreen
    let assembly: AppAssembly
    
    init(
        coordinator: AppCoordinator,
        assembly: AppAssembly
    ) {
        self.rootScreen = AllCarsModule.build(
            agregator: assembly.agregator,
            coordinator: coordinator
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
                            AllCarsModule.build(agregator: assembly.agregator, coordinator: coordinator)
                        }
                    }
            }
            .tabItem {
                Label("Все автомобили", systemImage: "car.side")
            }
            
            VStack {
                Text("Настройки")
            }
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
