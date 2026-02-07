//
//  RentScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//

import SwiftUI

struct RentScreen: View {
    @ObservedObject private var viewModel: RentViewModel
    private let presenter: RentPresenter
    
    init(
        viewModel: RentViewModel,
        presenter: RentPresenter
    ) {
        self.viewModel = viewModel
        self.presenter = presenter
    }
    
    var body: some View {
        Text("Взять в аренду")
    }
}

extension RentScreen {
    
}
