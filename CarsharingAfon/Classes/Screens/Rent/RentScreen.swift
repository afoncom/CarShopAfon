//
//  RentScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

struct RentScreen: View {
    @StateObject private var viewModel: RentViewModel
    private let presenter: RentPresenter
    
    init(
        viewModel: RentViewModel,
        presenter: RentPresenter
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.presenter = presenter
    }
    
    var body: some View {
        Text(L10n.Text.rent)
    }
}

extension RentScreen {
    
}
