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
                bodyStyle: "SUV", exteriorColor: "White", fuel: "Gas Regulae"
            ),
            RegularCar(
                brand: "BMW", model: "X5",highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: "SUV", exteriorColor: "Black", fuel: "Gas Regulae"
            ),
            RegularCar(
                brand: "Audi", model: "A8", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: "SUV", exteriorColor: "Everest White", fuel: "Gas Regulae"
            ),
            RegularCar(
                brand: "Audi", model: "A5", highway: "20/27 MPG", transmission: "9-speed",
                engine: "6 Cyl - 3.5 L", bodyStyle: "SUV", exteriorColor: "Green", fuel: "Gas Regulae"
            )
        ]
    )
    
    private let carManager2 = CarManager2(
        cars: [
            RegularCar(
                brand: "Geely", model: "Coolry", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: "SUV", exteriorColor: "Cherry Burgundy", fuel: "Gas Regulae"
            ),
            RegularCar(
                brand: "Tesla", model: "Model3", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: "SUV", exteriorColor: "Gray", fuel: "Gas Regulae"
            ),
            RegularCar(
                brand: "Renault", model: "Logan", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: "SUV", exteriorColor: "Red", fuel: "Gas Regulae"
            ),
            RegularCar(
                brand: "Lada", model: "Vesta", highway: "20/27 MPG", transmission: "9-speed", engine: "6 Cyl - 3.5 L",
                bodyStyle: "SUV", exteriorColor: "Total Black", fuel: "Gas Regulae"
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
