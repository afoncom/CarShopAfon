//
//  RentPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

protocol RentPresenter {

}

final class RentPresenterImpl {
    private let viewModel: RentViewModel
    private let coordinator: GetCarsRentCoordinator
    
    init(
        viewModel: RentViewModel,
        coordinator: GetCarsRentCoordinator
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
}

extension RentPresenterImpl: RentPresenter {

}
