//
//  AllCarsScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 08.01.2026.
//

import SwiftUI

struct AllCarsScreen: View {
    @StateObject private var viewModel: AllCarsViewModel
    private let presenter: AllCarsPresenter
    
    init(
        viewModel: AllCarsViewModel,
        presenter: AllCarsPresenter
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
                
                HStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 16) {
                            Label(car.highway, systemImage: "fuelpump")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Label(car.transmission, systemImage: "gearshape")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        HStack(spacing: 16) {
                            Label(car.bodyStyle.name, systemImage: "car")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Label(car.exteriorColor, systemImage: "paintpalette")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    Text(car.isRented ? "В аренде" : "Свободно")
                        .font(.caption)
                        .foregroundColor(car.isRented ? .red : .green)
                }
            }
            .contentShape(Rectangle())
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
