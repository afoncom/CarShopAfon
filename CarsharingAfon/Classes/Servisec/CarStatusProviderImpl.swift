//
//  CarStatusProviderImpl.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

protocol CarStatusProvider {
    func rentedCars() -> [RegularCar]
}

final class CarStatusProviderImpl: CarStatusProvider {
    private var carManagers: [CarManager]
    
    init(carManagers: [CarManager]) {
        self.carManagers = carManagers
    }
    
    func rentedCars() -> [RegularCar]{
        var isRentCars: [RegularCar] = []
        
        for manager in carManagers {
            for car in manager.getAllCars() {
                if car.isRented {
                    isRentCars.append(car)
                }
            }
        }
        return isRentCars
    }
}
