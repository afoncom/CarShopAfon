//
//  AppCoordinator.swift
//  CarsharingAfon
//
//  Created by afon.com on 20.01.2026.
//

import Combine
import SwiftUI

enum Route: Hashable, Equatable {
    case allCars
    case carDetails(String)
    case addCar
}

protocol AllCarsCoordinator {
    func openCarDetails(carId: String)
    func openAddCarView()
}


protocol WelcomeCoordinator {
    func navigateToAllCars()
}

@MainActor
final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
}

extension AppCoordinator: AllCarsCoordinator {
    func openCarDetails(carId: String) {
        path.append(Route.carDetails(carId))
    }
    
    func openAddCarView() {
        path.append(Route.addCar)
    }
}

extension AppCoordinator: WelcomeCoordinator {
    func navigateToAllCars() {
        path.append(Route.allCars)
    }
}
