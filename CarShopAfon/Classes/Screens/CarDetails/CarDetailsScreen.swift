//
//  CarDetailsScreen.swift
//  CarShopAfon
//
//  Created by afon.com on 17.01.2026.
//

import SwiftUI


struct CarDetailsScreen: View {
    @StateObject private var viewModel: CarDetailsViewModel
    @State private var showSafari = false
    private let presenter: CarDetailsPresenter
    
    init(
        viewModel: CarDetailsViewModel,
        presenter: CarDetailsPresenter
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
                Text(L10n.Text.error)
                    .foregroundStyle(Color.textDark)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
        .navigationTitle(L10n.NavigationTitle.characteristic)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showSafari) {
            if let url = URL(string: viewModel.selectedCar?.brand.shopURL ?? "") {
                SafariView(url: url)
            } else {
                Text("Не удалось загрузить страницу")
                    .foregroundStyle(Color.textDark)
            }
        }
        .task {
            await presenter.loadCar(id: viewModel.selectedCarId)
        }
    }
}


extension CarDetailsScreen {
    func makeDetailsView() -> some View {
        VStack {
            
            carImageView()
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 16) {
                Text((viewModel.selectedCar?.brand.rawValue ?? "") + " " + (viewModel.selectedCar?.model ?? ""))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.text)
                
                makeDetailsViewTable()
                
                makeDetailsViewUnderTabView()
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.appBackground)
        }
    }
    
    @ViewBuilder
    func carImageView() -> some View {
        if let imageURLString = viewModel.selectedCar?.imageURL,
           !imageURLString.isEmpty,
           let imageUrl = URL(string: imageURLString) {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
            } placeholder: {
                ProgressView()
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
            }
        } else {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .overlay {
                    Text("No image")
                        .foregroundColor(.gray)
                }
        }
    }
}


extension CarDetailsScreen {
    func makeDetailsViewTable() -> some View {
        VStack(spacing: 20) {
            HStack(spacing: 0) {
                SpecItem(
                    icon: "🏔️",
                    title: L10n.Title.highway,
                    value: viewModel.selectedCar?.highway ?? ""
                )
                Spacer()
                SpecItem(
                    icon: "⚙️",
                    title: L10n.Title.transmission,
                    value: viewModel.selectedCar?.transmission ?? ""
                )
                Spacer()
                SpecItem(
                    icon: "🔧",
                    title: L10n.Title.engine,
                    value: viewModel.selectedCar?.engine ?? ""
                )
            }
            
            HStack(spacing: 0) {
                SpecItem(
                    icon: "🚙",
                    title: L10n.Title.bodyStyle,
                    value: viewModel.selectedCar?.bodyStyle.name ?? ""
                )
                Spacer()
                SpecItem(
                    icon: "🎨",
                    title: L10n.Title.exteriorColor,
                    value: viewModel.selectedCar?.exteriorColor ?? ""
                )
                Spacer()
                SpecItem(
                    icon: "⛽️",
                    title: L10n.Title.fuel,
                    value: viewModel.selectedCar?.fuel.name ?? ""
                )
            }
        }
    }
    
    
    func makeDetailsViewUnderTabView() -> some View {
        VStack {
            HStack {
                Text(L10n.Text.price)
                    .font(.caption)
                    .foregroundColor(Color.textSubGray)
                Spacer()
                
                Text("$34040")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.text)
            }
            .frame(maxWidth: .infinity)
            
            
            HStack(spacing: 6) {
                Button(action: { showSafari = true }
                ) {
                    Text(L10n.Button.visitStore)
                        .foregroundColor(Color.text)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.textSubGray, lineWidth: 1)
                        )
                }
                
                Button(action: {}) {
                    Text(L10n.Button.buy)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.text)
                        )
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.text.opacity(0.1))
        )
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
                    .fill(Color.textSubGray.opacity(0.2))
                    .frame(width: 30, height: 30)
                
                Text(icon)
                    .font(.system(size: 15))
            }
            
            Text(title)
                .font(.caption)
                .foregroundColor(Color.textSubGray)
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.text)
        }
        .frame(maxWidth: .infinity)
    }
}

extension CarDetailsScreen {
    enum ViewState {
        case loading
        case loaded
        case error
    }
}
