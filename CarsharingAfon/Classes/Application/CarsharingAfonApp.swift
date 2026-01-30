//
//  CarsharingAfonApp.swift
//  CarsharingAfon
//
//  Created by afon.com on 08.01.2026.
//

import SwiftUI

@main
struct CarsharingAfonApp: App {
    @StateObject private var coordinator = AppCoordinator()
    private let appAssembly: AppAssembly = AppAssemblyImpl()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                WelcomeModule.build(coordinator: coordinator)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .allCars:
                            AllCarsModule.build(agregator: appAssembly.agregator, coordinator: coordinator)
                        case .carDetails(let carId):
                            GetCarsRentModule.build(carId: carId, agregator: appAssembly.agregator)
                        }
                    }
            }
        }
    }
}
