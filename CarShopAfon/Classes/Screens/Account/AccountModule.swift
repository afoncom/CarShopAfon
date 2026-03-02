//
//  AccountModule.swift
//  CarShopAfon
//
//  Created by afon.com on 27.02.2026.
//

import SwiftUI

final class AccountModule {
    static func build() -> AccountScreen {
        let viewModel = AccountViewModel()
        let presenter = AccountPresenterImpl(viewModel: viewModel)
        
        return AccountScreen(viewModel: viewModel, presenter: presenter)
    }
}
