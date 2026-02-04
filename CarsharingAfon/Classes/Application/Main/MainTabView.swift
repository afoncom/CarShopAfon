//
//  MainTabView.swift
//  CarsharingAfon
//
//  Created by afon.com on 04.02.2026.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var coordinator: AppCoordinator
    let assembly: AppAssembly
    
    var body: some View {
        TabView {
            NavigationStack(path: $coordinator.path) {
                AllCarsModule.build(
                    agregator: assembly.agregator,
                    coordinator: coordinator
                )
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
