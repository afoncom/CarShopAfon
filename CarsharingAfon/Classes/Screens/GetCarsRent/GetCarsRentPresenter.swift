//
//  GetCarsRentPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

protocol GetCarsRentPresenter {
    func loadCar(id: String) async
}

final class GetCarsRentPresenterImpl {
    private let viewModel: GetCarsRentViewModel
    private let agregator: Agregator
    
    init(
        viewModel: GetCarsRentViewModel,
        agregator: Agregator
    ) {
        self.viewModel = viewModel
        self.agregator = agregator
    }
}

extension GetCarsRentPresenterImpl: GetCarsRentPresenter {
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
