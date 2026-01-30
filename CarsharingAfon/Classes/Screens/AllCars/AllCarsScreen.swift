//
//  AllCarsScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 08.01.2026.
//

import SwiftUI

struct AllCarsScreen: View {
    @ObservedObject private var viewModel: AllCarsViewModel
    private let presenter: AllCarsPresenter
    
    init(
        viewModel: AllCarsViewModel,
        presenter: AllCarsPresenter
    ) {
        self.viewModel = viewModel
        self.presenter = presenter
    }
    
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("Все автомобили")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {viewModel.triggerAlert = true}) {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Данный функционал ещё недоступен", isPresented: $viewModel.triggerAlert) {
                Button ("ОК") { }
            }
        }
    }
}
