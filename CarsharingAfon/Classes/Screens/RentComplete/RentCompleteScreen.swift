//
//  RentCompleteScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

struct RentCompleteScreen: View {
    @ObservedObject private var viewModel: RentCompleteViewModel
    private let presenter: RentCompletePresenter
    
    init(
        viewModel: RentCompleteViewModel,
        presenter: RentCompletePresenter
    ) {
        self.viewModel = viewModel
        self.presenter = presenter
    }
    
    var body: some View {
        Text("Аренда завершена")
    }
}

extension RentCompleteScreen {
    
}
