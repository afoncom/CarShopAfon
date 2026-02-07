//
//  WelcomeScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 30.01.2026.
//

import SwiftUI

struct WelcomeScreen: View {
    @StateObject private var viewModel: WelcomeViewModel
    private let presenter: WelcomePresenter
    
    init(
        viewModel: WelcomeViewModel,
        presenter: WelcomePresenter
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.presenter = presenter
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text ("CarsharingAfon")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
        .task {
            try? await Task.sleep(for: .seconds(3))
            presenter.completeWelcome()
        }
    }
}
