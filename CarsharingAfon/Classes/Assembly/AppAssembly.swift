//
//  Assembly.swift
//  CarsharingAfon
//
//  Created by afon.com on 21.01.2026.
//

import Foundation


protocol AppAssembly {
    var agregator: Agregator { get }
    var themeManager: ThemeManager { get }
    var languageManager: LanguageManager { get }
}

final class AppAssemblyImpl: AppAssembly {
    
    private let carManager1 = CarManagerImpl(
        listCar: [
            RegularCar(
                brand: "BMW", model: "M3", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: .sedan, exteriorColor: "White", fuel: .gasoline
            ),
            RegularCar(
                brand: "BMW", model: "X5",highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: .suv, exteriorColor: "Black", fuel: .diesel
            ),
            RegularCar(
                brand: "Audi", model: "A8", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: .sedan, exteriorColor: "Everest White", fuel: .gasoline
            ),
            RegularCar(
                brand: "Audi", model: "A5", highway: "20/27 MPG", transmission: "9-speed",
                engine: "6 Cyl - 3.5 L", bodyStyle: .coupe, exteriorColor: "Green", fuel: .diesel
            )
        ]
    )
    
    private let carManager2 = CarManager2(
        cars: [
            RegularCar(
                brand: "Geely", model: "Coolry", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: .suv, exteriorColor: "Cherry Burgundy", fuel: .gasoline
            ),
            RegularCar(
                brand: "Tesla", model: "Model3", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: .sedan, exteriorColor: "Gray", fuel: .electro
            ),
            RegularCar(
                brand: "Renault", model: "Logan", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: .sedan, exteriorColor: "Red", fuel: .gasoline
            ),
            RegularCar(
                brand: "Lada", model: "Vesta", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: .sedan, exteriorColor: "Total Black", fuel: .gasoline
            )
        ]
    )
    
    private let electricCarManager = ElectrickCarManager(cars: [])
    private var carManagers: [CarManager] {
        [carManager1, carManager2, electricCarManager]
    }
    
    private var carStatusProvider: CarStatusProvider {
        CarStatusProviderImpl(carManagers: carManagers)
    }
    let themeManager: ThemeManager = ThemeManagerImpl()
    var languageManager: LanguageManager = LanguageManagerImpl()
    var agregator: Agregator {
        AgregatorImpl(carManagers: carManagers)
    }
}

extension AppAssemblyImpl: SettingAssembly {
    
}
