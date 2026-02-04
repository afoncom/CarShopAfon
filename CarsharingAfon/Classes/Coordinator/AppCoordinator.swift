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

enum RootRoute: Hashable, Equatable {
    case welcome
    case main
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
    @Published var rootRoute: RootRoute
    
    init(
        path: NavigationPath = NavigationPath(),
        rootRoute: RootRoute
    ) {
        self.path = path
        self.rootRoute = rootRoute
    }
    func finishWelcome() {
        rootRoute = .main
    }
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
        finishWelcome()
    }
}
