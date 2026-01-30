//
//  GetCarsRentScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

import SwiftUI

struct GetCarsRentScreen: View {
    @ObservedObject private var viewModel: GetCarsRentViewModel
    private let presenter: GetCarsRentPresenter
    
    init(
        viewModel: GetCarsRentViewModel,
        presenter: GetCarsRentPresenter
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
                    makeDetailsView()
                    makeButtonsView()
                }
            case .error:
                Text("Ошибка")
            }
        }
        .navigationTitle("Detaling")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await presenter.loadCar(id: viewModel.selectedCarId)
        }
    }
}



extension GetCarsRentScreen {
    func makeDetailsView() -> some View {
        VStack(spacing: 12) {
            if let car = viewModel.selectedCar {
                Text ("Бренд: \(car.brand)")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Марка: \(car.model)")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Двери: \(car.door)")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Окна: \(car.window)")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Статус автомобиля: \(car.isRented ? "В аренде" : "Свободно")")
                    .font(.body)
                    .presentationDetents([.medium])
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    func makeButtonsView() -> some View {
        HStack {
            Button(action: {}) {
                Text ("Взять в аренду")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(.green)
            .cornerRadius(12)
            .padding()
            
            Button(action: {}) {
                Text ("Вернуть")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(.red)
            .cornerRadius(12)
            .padding()
        }
    }
}


extension GetCarsRentScreen {
    enum ViewState {
        case loading
        case loaded
        case error
    }
}
