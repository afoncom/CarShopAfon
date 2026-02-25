//
//  AppCoordinator.swift
//  CarsharingAfon
//
//  Created by afon.com on 20.01.2026.
//

import Combine
import SwiftUI
import StoreKit

enum Route: Hashable, Equatable {
    case allCars
    case carDetails(String)
    case addCar
    case rent
    case rentComplete
}

enum RootRoute: Hashable, Equatable {
    case welcome
    case main
}

@MainActor
final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var rootRoute: RootRoute
    
    init(
        rootRoute: RootRoute
    ) {
        self.rootRoute = rootRoute
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
        rootRoute = .main
    }
}

extension AppCoordinator: GetCarsRentCoordinator {
    func openRentScreen() {
        path.append(Route.rent)
    }
    
    func openRentCompleteView() {
        path.append(Route.rentComplete)
    }
}
