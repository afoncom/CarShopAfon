//
//  ElectrickCarManager.swift
//  CarShopAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

final class ElectroCarManager: CarManager {
    private var cars: [RegularCar]
    
    init(cars: [RegularCar]) {
        self.cars = cars
    }
    
    func getAllCars() -> [RegularCar] {
        cars
    }
    
    func deleteAllCars() {
        cars.removeAll()
    }
    
    func addCar(_ car: RegularCar) {
        cars.append(car)
    }
}
