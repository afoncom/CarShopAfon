//
//  AgregatorImpl.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

protocol Agregator {
    func getAllCars() -> [RegularCar]
    func deleteAllCars()
    func rent(brand: String, model: String, isRenting: Bool) -> Bool
    func startStopCar(brand: String, model: String, isStart: Bool) -> Bool
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
    
    func rent(brand: String, model: String, isRenting: Bool) -> Bool {
        let allCars = getAllCars()
        
        for car in allCars {
            if brand == car.brand, model == car.model {
                car.rent(isRenting)
                return true
            }
        }
        return false
    }
    
    func startStopCar(brand: String, model: String, isStart: Bool) -> Bool {
        let allCar = getAllCars()
        
        for car in allCar {
            if brand == car.brand, model == car.model {
                isStart ? car.start() : car.stop()
                return true
            }
        }
        return false
    }
    
    func getCarById(id: String) -> RegularCar? {
        getAllCars().first { $0.id == id }
    }
}
