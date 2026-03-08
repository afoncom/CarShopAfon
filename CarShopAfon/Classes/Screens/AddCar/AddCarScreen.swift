//
//  AddCarScreen.swift
//  CarShopAfon
//
//  Created by afon.com on 25.01.2026.
//

import SwiftUI

struct AddCarScreen: View {
    @StateObject private var viewModel: AddCarViewModel
    private let presenter: AddCarPresenter
    
    @State private var brand = ""
    @State private var model = ""
    @State private var highway = ""
    @State private var transmission = ""
    @State private var engine = ""
    @State private var bodyStyle = ""
    @State private var exteriorColor = ""
    @State private var fuel = ""
    @State private var imageURL = ""
    
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
                TextField("Марка", text: $brand)
                    .foregroundColor(Color.textDark)
                TextField("Модель", text: $model)
                    .foregroundColor(Color.textDark)
                TextField("Цвет", text: $exteriorColor)
                    .foregroundColor(Color.textDark)
            }
            .foregroundColor(Color.textDark)
            
            Section("Характеристики") {
                TextField("Расход", text: $highway)
                    .foregroundColor(Color.textDark)
                TextField("КПП", text: $transmission)
                    .foregroundColor(Color.textDark)
                TextField("Двигатель", text: $engine)
                    .foregroundColor(Color.textDark)
                TextField("Тип кузова", text: $bodyStyle)
                    .foregroundColor(Color.textDark)
                TextField("Топливо", text: $fuel)
                    .foregroundColor(Color.textDark)
            }
            .foregroundColor(Color.textDark)
            
            Section("Изображение") {
                TextField("Ссылка на фото", text: $imageURL)
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
