//
//  AddCarScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 25.01.2026.
//

import SwiftUI

struct AddCarScreen: View {
    @StateObject private var viewModel: AddCarViewModel
    private let presenter: AddCarPresenter
    
    init(
        viewModel: AddCarViewModel,
        presenter: AddCarPresenter
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.presenter = presenter
    }
    
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView()
            case .loaded:
                VStack {
                    Text(L10n.Text.loaded)
                        .foregroundStyle(Color.textDark)
                }
            case .error:
                Text(L10n.Text.error)
                    .foregroundStyle(Color.textDark)
            }
        }
        
    }
}


extension AddCarScreen {
    enum ViewState {
        case loading
        case loaded
        case error
    }
}
