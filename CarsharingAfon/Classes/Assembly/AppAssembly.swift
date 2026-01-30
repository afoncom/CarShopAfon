//
//  Assembly.swift
//  CarsharingAfon
//
//  Created by afon.com on 21.01.2026.
//

import Foundation


protocol AppAssembly {
    var agregator: Agregator { get }
}


final class AppAssemblyImpl: AppAssembly {
    private let carManager1 = CarManagerImpl(
        listCar: [
            RegularCar(window: 4, door: 5, brand: "BMW", model: "M3"),
            RegularCar(window: 4, door: 5, brand: "BMW", model: "X5"),
            RegularCar(window: 4, door: 3, brand: "Audi", model: "A8"),
            RegularCar(window: 4, door: 5, brand: "Audi", model: "A5")
            
        ]
    )
    
    private let carManager2 = CarManager2(
        cars: [
            RegularCar(window: 4, door: 5, brand: "Geely", model: "Coolry"),
            RegularCar(window: 4, door: 3, brand: "Tesla", model: "Model3"),
            RegularCar(window: 4, door: 5, brand: "Renault", model: "Logan"),
            RegularCar(window: 4, door: 5, brand: "Lada", model: "Vesta")
        ]
    )
    
    private let electricCarManager = ElectrickCarManager(cars: [])
    private var carManagers: [CarManager] {
        [carManager1, carManager2, electricCarManager]
    }
    
    private var carStatusProvider: CarStatusProvider {
        CarStatusProviderImpl(carManagers: carManagers)
    }
    
    var agregator: Agregator {
        AgregatorImpl(carManagers: carManagers)
    }
}
