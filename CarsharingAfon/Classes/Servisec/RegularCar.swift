//
//  RegularCar.swift
//  CarsharingAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

protocol Car {
    var brand: String { get }
    var model: String { get }
    var window: Int { get }
    var door: Int { get }
    var started: Bool { get }
    var isRented: Bool { get }
    func start()
    func stop()
    func rent(_ isRented: Bool)
}

final class RegularCar: Car {
    let brand: String
    
    let model: String
    let window: Int
    let door: Int
    
    var started: Bool = false
    var isRented: Bool = false
    
    func start() {
        started = true
    }
    
    func stop() {
        started = false
    }
    
    func rent(_ isRented: Bool) {
        self.isRented = isRented
    }
    
    
    init(window: Int, door: Int, brand: String, model: String) {
        self.window = window
        self.door = door
        self.model = model
        self.brand = brand
    }
}

extension Car {
    var id: String {
        brand + model
    }
}
