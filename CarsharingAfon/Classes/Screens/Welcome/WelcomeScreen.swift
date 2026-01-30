//
//  WelcomeScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 30.01.2026.
//

import SwiftUI

struct WelcomeScreen: View {
    private let presenter: WelcomePresenter
    
    init(
        presenter: WelcomePresenter
    ) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack(spacing: 20) {
            makeWelcomeText()
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                presenter.navigateToAllCars()
            }
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
