//
//  AllCarsPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 13.01.2026.
//

protocol AllCarsPresenter {
    func loadCars()
    func showDetails(car: RegularCar)
}

final class AllCarsPresenterImpl {
    private let viewModel: AllCarsViewModel
    private let agregator: Agregator
    private let coordinator: AllCarsCoordinator
    
    init(
        viewModel: AllCarsViewModel,
        agregator: Agregator,
        coordinator: AllCarsCoordinator
    ) {
        self.viewModel = viewModel
        self.agregator = agregator
        self.coordinator = coordinator
    }
}

extension AllCarsPresenterImpl: AllCarsPresenter {
    
    func loadCars() {
        viewModel.allCars = agregator.getAllCars() 
    }
    
    func showDetails(car: RegularCar) {
        coordinator.openCarDetails(carId: car.id)
        print(car.id)
    }
}
