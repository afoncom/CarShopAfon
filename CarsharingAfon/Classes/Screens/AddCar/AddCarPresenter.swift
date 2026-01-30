//
//  AddCarPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 25.01.2026.
//

protocol AddCarPresenter {
    
}

final class AddCarPresenterImpl {
    private let viewModel: AddCarViewModel
    private let agregator: Agregator
    
    init(
        viewModel: AddCarViewModel,
        agregator: Agregator,
    ) {
        self.viewModel = viewModel
        self.agregator = agregator
    }
}

extension AddCarPresenterImpl: AddCarPresenter {
    
}
