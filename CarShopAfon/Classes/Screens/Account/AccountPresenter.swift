//
//  AccountPresenter.swift
//  CarShopAfon
//
//  Created by afon.com on 27.02.2026.
//

protocol AccountPresenter {
    func load()
}

final class AccountPresenterImpl {
    private let viewModel: AccountViewModel
    
    init(viewModel: AccountViewModel) {
        self.viewModel = viewModel
    }
}

extension AccountPresenterImpl: AccountPresenter {
    func load() {
        viewModel.viewState = .loaded
    }
}
