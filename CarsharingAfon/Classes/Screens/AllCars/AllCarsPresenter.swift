//
//  AllCarsPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 13.01.2026.
//

protocol AllCarsPresenter {
    func loadCars() async
    func showDetails(car: RegularCar)
    func openAddCar()
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
    
    func loadCars() async {
        try? await Task.sleep(for: .seconds(3))
        
        let list = agregator.getAllCars()
        if !list.isEmpty {
            viewModel.allCars = list
            viewModel.viewState = .loaded
        } else {
            viewModel.viewState = .error
        }
    }
    
    func showDetails(car: RegularCar) {
        coordinator.openCarDetails(carId: car.id)
        print(car.id)
    }
    
    func openAddCar() {
        coordinator.openAddCarView()
    }
}
