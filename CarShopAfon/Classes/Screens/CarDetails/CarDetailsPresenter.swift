//
//  CarDetailsPresenter.swift
//  CarShopAfon
//
//  Created by afon.com on 17.01.2026.
//

protocol CarDetailsPresenter {
    func loadCar(id: String) async
}

final class CarDetailsPresenterImpl {
    private let viewModel: CarDetailsViewModel
    private let agregator: Agregator
    private let coordinator: GetCarsRentCoordinator
    
    init(
        viewModel: CarDetailsViewModel,
        agregator: Agregator,
        coordinator: GetCarsRentCoordinator
    ) {
        self.viewModel = viewModel
        self.agregator = agregator
        self.coordinator = coordinator
    }
}

extension CarDetailsPresenterImpl: CarDetailsPresenter {
    func loadCar(id: String) async {
        try? await Task.sleep(for: .seconds(3))
        
        if let car = agregator.getCarById(id: id) {
            viewModel.selectedCar = car
            viewModel.viewState = .loaded
        } else {
            viewModel.viewState = .error
        }
    }
}
