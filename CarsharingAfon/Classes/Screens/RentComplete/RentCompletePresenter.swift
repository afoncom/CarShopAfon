//
//  RentCompletePresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

protocol RentCompletePresenter {

}

final class RentCompletePresenterImpl {
    private let viewModel: RentCompleteViewModel
    private let coordinator: GetCarsRentCoordinator
    
    init(
        viewModel: RentCompleteViewModel,
        coordinator: GetCarsRentCoordinator
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
}

extension RentCompletePresenterImpl: RentCompletePresenter {
    
}
