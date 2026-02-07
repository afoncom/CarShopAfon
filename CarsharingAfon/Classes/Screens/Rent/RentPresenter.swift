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
    
    init(viewModel: RentViewModel) {
        self.viewModel = viewModel
    }
}

extension RentPresenterImpl: RentPresenter {

}
