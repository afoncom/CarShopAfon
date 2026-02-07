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
    
    init(viewModel: RentCompleteViewModel) {
        self.viewModel = viewModel
    }
}

extension RentCompletePresenterImpl: RentCompletePresenter {
    
}
