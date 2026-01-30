//
//  WelcomePresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 30.01.2026.
//

import SwiftUI
protocol WelcomePresenter {
    func navigateToAllCars()
}

final class WelcomePresenterImpl {
    private let coordinator: AppCoordinator
    
    init(
        coordinator: AppCoordinator
    ) {
        self.coordinator = coordinator
    }
}

extension WelcomePresenterImpl: WelcomePresenter {
    func navigateToAllCars() {
        (coordinator as? AppCoordinatorImpl)?.path.append(Route.allCars)
    }
}
