//
//  GetCarsRentScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

import SwiftUI

struct GetCarsRentScreen: View {
    @StateObject private var viewModel: GetCarsRentViewModel
    private let presenter: GetCarsRentPresenter
    
    init(
        viewModel: GetCarsRentViewModel,
        presenter: GetCarsRentPresenter
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
                makeDetailsView()
            case .error:
                Text("Ошибка")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .navigationTitle("Detaling")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await presenter.loadCar(id: viewModel.selectedCarId)
        }
    }
}



extension GetCarsRentScreen {
    func makeDetailsView() -> some View {
        GeometryReader { proxy in
            VStack(spacing: 12) {
                Spacer()
                
                
                Rectangle()
                    .fill(Color.backgroundsmallview)
                    .frame(height: proxy.size.height / 2)
                    .overlay(
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Car.name")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            
                            VStack {
                                HStack {
                                    Text("Price")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    
                                    Text("$34040")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .padding(20)
                                
                                
                                HStack(spacing: 12) {
                                    Button("Visit Store") {
                                        
                                    }
                                    .buttonStyle(.bordered)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    Spacer()
                                    Button("Buy Now") {
                                        
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .foregroundColor(.black)
                                    .tint(.white)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white.opacity(0.1))
                            )
                            .padding(.horizontal, 5)
                        }
                            .padding(20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    )
                    .ignoresSafeArea()
                    .cornerRadius(20)
                    .background(Color.backgroundsmallview)
            }
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
