//
//  AllCarsScreen.swift
//  CarShopAfon
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
                Text(L10n.Text.error)
                    .foregroundStyle(Color.textDark)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
        .navigationTitle(L10n.NavigationTitle.allCars)
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
            VStack(alignment: .leading, spacing: 8) {
                Text("\(car.brand.rawValue) \(car.model)")
                    .foregroundStyle(Color.textDark)
                    .font(.headline)
                
                HStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 6) {
                        Label(car.highway, systemImage: "fuelpump")
                        Label(car.transmission, systemImage: "gearshape")
                        Label(car.bodyStyle.name, systemImage: "car")
                        Label(car.exteriorColor, systemImage: "paintpalette")
                    }
                    .font(.caption)
                    .foregroundColor(Color.textSubGray)
                    
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                presenter.showDetails(car: car)
            }
            .listRowBackground(Color.appBackground)
        }
        .scrollContentBackground(.hidden)
        .background(Color.clear)
    }
}

extension AllCarsScreen {
    enum ViewState {
        case loading
        case loaded
        case error
    }
}
