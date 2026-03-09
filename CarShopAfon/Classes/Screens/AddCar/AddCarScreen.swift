//
//  AddCarScreen.swift
//  CarShopAfon
//
//  Created by afon.com on 25.01.2026.
//

import SwiftUI

struct AddCarScreen: View {
    @Bindable private var viewModel: AddCarViewModel
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
                
                makeMainViewScreen()
                
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


extension AddCarScreen {
    func makeMainViewScreen() -> some View  {
        Form {
            Section("Основное") {
                TextField("Марка", text: $viewModel.brand)
                    .foregroundColor(Color.textDark)
                TextField("Модель", text: $viewModel.model)
                    .foregroundColor(Color.textDark)
                TextField("Цвет", text: $viewModel.exteriorColor)
                    .foregroundColor(Color.textDark)
            }
            .foregroundColor(Color.textDark)
            
            Section("Характеристики") {
                TextField("Расход", text: $viewModel.highway)
                    .foregroundColor(Color.textDark)
                TextField("КПП", text: $viewModel.transmission)
                    .foregroundColor(Color.textDark)
                TextField("Двигатель", text: $viewModel.engine)
                    .foregroundColor(Color.textDark)
                TextField("Тип кузова", text: $viewModel.bodyStyle)
                    .foregroundColor(Color.textDark)
                TextField("Топливо", text: $viewModel.fuel)
                    .foregroundColor(Color.textDark)
            }
            .foregroundColor(Color.textDark)
            
            Section("Изображение") {
                TextField("Ссылка на фото", text: $viewModel.imageURL)
                    .foregroundColor(Color.textDark)
            }
            .foregroundColor(Color.textDark)
            
            Button(action: {}) {
                Text("Сохранить")
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.textDark)
        }
        .scrollContentBackground(.hidden)
        .background(Color.appBackground)
        .navigationTitle("Новый автомобиль")
    }
}
