//
//  CarManager2.swift
//  CarShopAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

final class CarManager2: CarManager {
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
}
