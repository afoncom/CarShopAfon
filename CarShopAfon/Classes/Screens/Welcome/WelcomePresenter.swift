//
//  WelcomePresenter.swift
//  CarShopAfon
//
//  Created by afon.com on 30.01.2026.
//

protocol WelcomePresenter {
    func completeWelcome()
}

final class WelcomePresenterImpl {
    private let viewModel: WelcomeViewModel
    private let coordinator: WelcomeCoordinator
    
    init(
        viewModel: WelcomeViewModel,
        coordinator: WelcomeCoordinator
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
}

extension WelcomePresenterImpl: WelcomePresenter {
    func completeWelcome() {
        coordinator.navigateToAllCars()
    }
}
