//
//  AccountScreen.swift
//  CarShopAfon
//
//  Created by afon.com on 05.03.2026.
//

import SwiftUI

struct AccountScreen: View {
    @StateObject private var viewModel: AccountViewModel
    private let presenter: AccountPresenter
    
    init(
        viewModel: AccountViewModel,
        presenter: AccountPresenter
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
                makeAccountView()
            case .error:
                Text(L10n.Text.error)
                    .foregroundStyle(Color.textDark)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
        .navigationTitle(L10n.NavigationTitle.account)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .task {
            presenter.load()
        }
    }
}

extension AccountScreen {
    func makeAccountView() -> some View {
        Text(L10n.NavigationTitle.account)
            .foregroundStyle(Color.textDark)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension AccountScreen {
    enum ViewState {
        case loading
        case loaded
        case error
    }
}
