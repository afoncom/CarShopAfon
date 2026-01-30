//
//  WelcomeScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 30.01.2026.
//

import SwiftUI

struct WelcomeScreen: View {
    @ObservedObject private var viewModel: WelcomeViewModel
    private let presenter: WelcomePresenter
    
    init(
        viewModel: WelcomeViewModel,
        presenter: WelcomePresenter
    ) {
        self.viewModel = viewModel
        self.presenter = presenter
    }
    
    var body: some View {
        VStack(spacing: 20) {
            makeWelcomeText()
        }
        .padding()
        .task {
            try? await Task.sleep(for: .seconds(3))
            presenter.completeWelcome()
        }
    }
}





extension WelcomeScreen {
    func makeWelcomeText() -> some View {
        VStack(spacing: 12) {
            Text ("CarsharingAfon")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
