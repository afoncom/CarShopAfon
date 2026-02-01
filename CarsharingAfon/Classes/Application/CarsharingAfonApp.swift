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
    private let appAssembly: AppAssembly
    @State private var rootScreen: AllCarsScreen
    
    init() {
        let coordinator = AppCoordinator()
        _coordinator = StateObject(wrappedValue: coordinator)
        
        let assembly = AppAssemblyImpl()
        self.appAssembly = assembly
        
        let screen = AllCarsModule.build(agregator: appAssembly.agregator, coordinator: coordinator)
        _rootScreen = State(initialValue: screen)
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack(path: $coordinator.path) {
                    WelcomeModule.build(coordinator: coordinator)
                        .navigationDestination(for: Route.self) { route in
                            switch route {
                            case .allCars:
                                rootScreen
                            case .carDetails(let carId):
                                GetCarsRentModule.build(carId: carId, agregator: appAssembly.agregator)
                            case .addCar:
                                AddCarModule.build(agregator: appAssembly.agregator)
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
}
