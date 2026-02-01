//
//  SettingPresenter.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

protocol SettingPresenter {

}

final class SettingPresenterImpl {
    private let viewModel: SettingViewModel
    
    init(
        viewModel: SettingViewModel,
    ) {
        self.viewModel = viewModel
    }
}

extension SettingPresenterImpl: SettingPresenter {

}
