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
    var highway: String { get }
    var transmission: String { get }
    var engine: String { get }
    var bodyStyle: BodyStyle { get }
    var exteriorColor: String { get }
    var fuel: FuelType { get }
    
    var started: Bool { get }
    var isRented: Bool { get }
    
    func start()
    func stop()
    func rent(_ isRented: Bool)
}

final class RegularCar: Car {
    let brand: String
    let model: String
    let highway: String
    let transmission: String
    let engine: String
    let bodyStyle: BodyStyle
    let exteriorColor: String
    let fuel: FuelType
    
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
    
    
    init(
        brand: String, model: String, highway: String, transmission: String,
        engine: String, bodyStyle: BodyStyle, exteriorColor: String, fuel: FuelType
    ) {
        self.brand = brand
        self.model = model
        self.highway = highway
        self.transmission = transmission
        self.engine = engine
        self.bodyStyle = bodyStyle
        self.exteriorColor = exteriorColor
        self.fuel = fuel
    }
}

extension Car {
    var id: String {
        brand + model
    }
}
