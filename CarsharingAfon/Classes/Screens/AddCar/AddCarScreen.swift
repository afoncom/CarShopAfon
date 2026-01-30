//
//  AddCarScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 25.01.2026.
//

import SwiftUI

struct AddCarScreen: View {
    @ObservedObject private var viewModel: AddCarViewModel
    private let presenter: AddCarPresenter
    
    init(
        viewModel: AddCarViewModel,
        presenter: AddCarPresenter
    ) {
        self.viewModel = viewModel
        self.presenter = presenter
    }
    
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView()
            case .loaded:
                VStack {
                    Text("Загружено")
                }
            case .error:
                Text("Ошибка")
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
