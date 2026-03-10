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
}
