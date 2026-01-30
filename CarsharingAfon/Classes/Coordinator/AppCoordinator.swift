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
}

protocol AllCarsCoordinator {
    func openCarDetails(carId: String)
}

protocol WelcomeCoordinator {
    func navigateToAllCars()
}

@MainActor
final class AppCoordinator: ObservableObject, AllCarsCoordinator, WelcomeCoordinator {
    @Published var path = NavigationPath()
    
    func openCarDetails(carId: String) {
        path.append(Route.carDetails(carId))
    }
    
    func navigateToAllCars() {
        path.append(Route.allCars)
    }
}
