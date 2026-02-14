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
        .ignoresSafeArea()
    }
}



extension GetCarsRentScreen {
    func makeDetailsView() -> some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                
                Rectangle()
                    .fill(Color.backgroundsmallview)
                    .frame(height: proxy.size.height / 2)
                    .overlay(
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Nissan Pathfinder")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 20) {
                                HStack {
                                    SpecItem(
                                        icon: "🏔️",
                                        title: "Highway",
                                        value: "20/27 MPG"
                                    )
                                    Divider()
                                        .frame(height: 40)
                                        .background(Color.gray.opacity(0.3))
                            
                            
                                    SpecItem(
                                        icon: "⚙️",
                                        title: "Transmission",
                                        value: "9-speed"
                                    )
                                    Divider()
                                        .frame(height: 40)
                                        .background(Color.gray.opacity(0.3))
                            
                                    SpecItem(
                                        icon: "🔧",
                                        title: "Engine",
                                        value: "6 Cyl - 3.5 L"
                                    )
                                }
                                Divider()
                                    .background(Color.gray.opacity(0.3))
                            
                                HStack {
                                    SpecItem(icon: "🚙", title: "Body Style", value: "SUV")
                                    Divider()
                                        .frame(height: 40)
                                        .background(Color.gray.opacity(0.3))
                            
                                    SpecItem(icon: "🎨", title: "Exterior Color", value: "Everest White")
                                    Divider()
                                        .frame(height: 40)
                                        .background(Color.gray.opacity(0.3))
                            
                                    SpecItem(icon: "⛽️", title: "Fuel", value: "Gas Regulae")
                                    Divider()
                                        .background(Color.gray.opacity(0.3))
                                }
                            }
                            Spacer()
                            
                            VStack {
                                HStack {
                                    Text("Mathews Price")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    
                                    Text("$34040")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                
                                
                                HStack(spacing: 6) {
                                    Button(action: {}) {
                                        Text("Visit Store")
                                        
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 12)
                                            .background(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                    }
                                    
                                    Button(action: {}) {
                                        Text("Buy Now")
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 12)
                                            .background(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color.white)
                                            )
                                    }
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white.opacity(0.1))
                            )
                            .padding(.bottom, 80)
                        }
                            .padding(20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    )
                    .background(Color.backgroundsmallview)
                    .cornerRadius(20)
            }
        }
    }
}




struct SpecItem: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 30, height: 30)
                
                Text(icon)
                    .font(.system(size: 15))
            }
            
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }
}

extension GetCarsRentScreen {
    enum ViewState {
        case loading
        case loaded
        case error
    }
}


