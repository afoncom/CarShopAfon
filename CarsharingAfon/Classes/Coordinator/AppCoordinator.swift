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

protocol AppCoordinator {
    func openCarDetails(carId: String)
}

@MainActor
final class AppCoordinatorImpl: ObservableObject, AppCoordinator {
    @Published var path = NavigationPath()
    
    func openCarDetails(carId: String) {
        path.append(Route.carDetails(carId))
    }
}
