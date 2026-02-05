//
//  AllCarsScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 08.01.2026.
//

import SwiftUI

struct AllCarsScreen: View {
    @ObservedObject private var viewModel: AllCarsViewModel
    @ObservedObject private var themeManager: ThemeManager
    private let presenter: AllCarsPresenter
    
    init(
        viewModel: AllCarsViewModel,
        presenter: AllCarsPresenter,
        themeManager: ThemeManager
    ) {
        self.viewModel = viewModel
        self.presenter = presenter
        self.themeManager = themeManager
    }
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView()
            case .loaded:
                makeListAllCarsView()
            case .error:
                Text("Ошибка")
            }
        }
        .navigationTitle("Все автомобили")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(viewModel.viewState != .loaded)
        .toolbar {
            if viewModel.viewState == .loaded {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { presenter.openAddCar() }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .task {
            await presenter.loadCars()
        }
    }
}

extension AllCarsScreen {
    func makeListAllCarsView() -> some View {
        List(Array(viewModel.allCars.enumerated()), id: \.offset) { index, car in
            VStack(alignment: .leading, spacing: 4) {
                Text("\(car.brand) \(car.model)")
                    .font(.headline)
                HStack {
                    Text("Окна: \(car.window),  Двери: \(car.door)")
                        .font(.subheadline)
                    Spacer()
                    Text(car.isRented ? "В аренде" : "Свободно")
                        .font(.caption)
                        .foregroundColor(car.isRented ? .red : .green)
                }
            }
            .onTapGesture {
                presenter.showDetails(car: car)
            }
        }
    }
}

extension AllCarsScreen {
    enum ViewState {
        case loading
        case loaded
        case error
    }
}
