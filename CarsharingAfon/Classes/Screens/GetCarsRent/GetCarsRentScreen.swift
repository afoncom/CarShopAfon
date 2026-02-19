//
//  GetCarsRentScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 17.01.2026.
//

import SwiftUI
import SafariServices

struct GetCarsRentScreen: View {
    @StateObject private var viewModel: GetCarsRentViewModel
    @State private var showSafari = false
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
                Text(L10n.Text.error)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .navigationTitle(L10n.NavigationTitle.characteristic)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showSafari) {
            if let url = URL(string: "https://www.audi.co.uk/en/models/a8/a8/") {
             SafariView(url: url)
            } else {
                Text("Не удалось загрузить страницу")
            }
        }
        .task {
            await presenter.loadCar(id: viewModel.selectedCarId)
        }
    }
}


extension GetCarsRentScreen {
    func makeDetailsView() -> some View {
        VStack {
            
            AsyncImage(url: URL(string: "https://i.ibb.co/chZdH3GL/audi-a8-white.png")) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            Spacer()
            
            VStack(alignment: .leading, spacing: 16) {
                Text((viewModel.selectedCar?.brand ?? "") + " " + (viewModel.selectedCar?.model ?? ""))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                makeDetailsViewTable()
                
                makeDetailsViewUnderTabView()
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                Rectangle()
                    .fill(Color.backgroundsmallview)
                    .cornerRadius(20)
                    .ignoresSafeArea(edges: [.bottom])
            )
        }
    }
}


extension GetCarsRentScreen {
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
                    .foregroundColor(.gray)
                Spacer()
                
                Text("$34040")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            
            
            HStack(spacing: 6) {

                Button(action: { showSafari = true }
                ) {
                    Text(L10n.Button.visitStore)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                
                Button(action: {}) {
                    Text(L10n.Button.buy)
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

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

extension GetCarsRentScreen {
    enum ViewState {
        case loading
        case loaded
        case error
    }
}
