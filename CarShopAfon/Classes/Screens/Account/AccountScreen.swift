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
    
    @State private var userName: String = L10n.Text.username
    @State private var email: String = "afon.com12@gmail.com"
    
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
        .task {
            presenter.load()
        }
    }
}

extension AccountScreen {
    func makeAccountView() -> some View {
        VStack(spacing: 20) {
            Image("имя картинки")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .shadow(radius: 5)
                .padding(.top, 30)
            
            VStack(spacing: 5) {
                Text(userName)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(email)
                    .foregroundColor(.gray)
            }
            
            Button(L10n.Button.edit) {}
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .padding(.vertical)
            
            List {
                Section {
                    Label(L10n.Text.notifications, systemImage: "bell.fill")
                    
                    Label(L10n.Text.privacy, systemImage: "lock.fill")
                    
                    Label(L10n.Text.exit, systemImage: "arrow.backward.circle.fill")
                }
                .listRowBackground(Color.appBackground)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.appBackground)
        }
        .padding()
    }
}

extension AccountScreen {
    enum ViewState {
        case loading
        case loaded
        case error
    }
}
