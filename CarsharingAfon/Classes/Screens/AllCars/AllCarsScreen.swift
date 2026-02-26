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
                Text(L10n.Text.error)
                    .foregroundStyle(Color.textDark)
            }
        }
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
            VStack(alignment: .leading, spacing: 4) {
                Text("\(car.brand.rawValue) \(car.model)")
                    .foregroundStyle(Color.textDark)
                    .font(.headline)
                
                HStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 16) {
                            Label(car.highway, systemImage: "fuelpump")
                                .font(.caption)
                                .foregroundColor(Color.textSubGray)
                            Label(car.transmission, systemImage: "gearshape")
                                .font(.caption)
                                .foregroundColor(Color.textSubGray)
                        }
                        HStack(spacing: 16) {
                            Label(car.bodyStyle.name, systemImage: "car")
                                .font(.caption)
                                .foregroundColor(Color.textSubGray)
                            Label(car.exteriorColor, systemImage: "paintpalette")
                                .font(.caption)
                                .foregroundColor(Color.textSubGray)
                        }
                    }
                    Spacer()
                    
                    Text(car.isRented ? L10n.Text.rent : L10n.Text.free)
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(car.isRented ? Color.negative : Color.positive)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(car.isRented ? Color.negative.opacity(0.1) : Color.positive.opacity(0.1))
                        .cornerRadius(6)
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
