//
//  RentCompleteScreen.swift
//  CarShopAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

struct RentCompleteScreen: View {
    @StateObject private var viewModel: RentCompleteViewModel
    private let presenter: RentCompletePresenter
    
    init(
        viewModel: RentCompleteViewModel,
        presenter: RentCompletePresenter
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.presenter = presenter
    }
    
    var body: some View {
        Text(L10n.Text.rentedIsCompleted)
            .foregroundStyle(Color.text)
    }
}

extension RentCompleteScreen {
    
}
