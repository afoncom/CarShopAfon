//
//  Agregator.swift
//  CarShopAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

protocol Agregator {
    func getAllCars() -> [RegularCar]
    func deleteAllCars()
    func getCarById(id: String) -> RegularCar?
    func addCar(_ car: RegularCar)
}

final class AgregatorImpl: Agregator {
    private let carManagers: [CarManager]
    
    init(carManagers: [CarManager]) {
        self.carManagers = carManagers
    }
    
    func getAllCars() -> [RegularCar] {
        carManagers.flatMap { $0.getAllCars() }
    }
    
    func deleteAllCars() {
        carManagers.forEach { $0.deleteAllCars() }
    }
    
    func getCarById(id: String) -> RegularCar? {
        getAllCars().first { $0.id == id }
    }
    
    func addCar(_ car: RegularCar) {
        switch car.fuel {
        case .diesel:
            if let dieselManager = carManagers.first(where: { $0 is DieselCarManager }) as? DieselCarManager {
                dieselManager.addCar(car)
            }
        case .gasoline:
            if let gasolineManager = carManagers.first(where: { $0 is GasolineCarManager }) as? GasolineCarManager {
                gasolineManager.addCar(car)
            }
        case .electro:
            if let electroManager = carManagers.first(where: { $0 is ElectroCarManager }) as? ElectroCarManager {
                electroManager.addCar(car)
            }
        }
    }
}
