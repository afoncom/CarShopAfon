//
//  CarManagerImpl.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

protocol CarManager {
    func getAllCars() -> [RegularCar]
    func deleteAllCars()
}

final class CarManagerImpl: CarManager {
    private var listCar: [RegularCar]
    
    init(listCar: [RegularCar]) {
        self.listCar = listCar
    }
    
    func getAllCars() -> [RegularCar] {
        listCar
    }
    
    func deleteAllCars() {
        listCar.removeAll()
    }
}
