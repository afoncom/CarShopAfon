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
    @State private var rootScreen: WelcomeScreen
    
    init() {
        let coordinator = AppCoordinator()
        _coordinator = StateObject(wrappedValue: coordinator)
        
        let assembly = AppAssemblyImpl()
        self.appAssembly = assembly
        
        let screen = WelcomeModule.build(coordinator: coordinator)
        _rootScreen = State(initialValue: screen)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                rootScreen
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .allCars:
                            AllCarsModule.build(agregator: appAssembly.agregator, coordinator: coordinator)
                        case .carDetails(let carId):
                            GetCarsRentModule.build(carId: carId, agregator: appAssembly.agregator)
                        case .addCar:
                            AddCarModule.build(agregator: appAssembly.agregator)
                        }
                    }
            }
        }
    }
}
