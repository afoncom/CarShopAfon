//
//  RegularCar.swift
//  CarShopAfon
//
//  Created by afon.com on 10.01.2026.
//

import Foundation

protocol Car {
    var brand: Brand { get }
    var model: String { get }
    var highway: String { get }
    var transmission: String { get }
    var engine: String { get }
    var bodyStyle: BodyStyle { get }
    var exteriorColor: String { get }
    var fuel: FuelType { get }
    var imageURL: String { get }
}

final class RegularCar: Car {
    let brand: Brand
    let model: String
    let highway: String
    let transmission: String
    let engine: String
    let bodyStyle: BodyStyle
    let exteriorColor: String
    let fuel: FuelType
    let imageURL: String
    
    
    init(
        brand: Brand,
        model: String,
        highway: String,
        transmission: String,
        engine: String,
        bodyStyle: BodyStyle,
        exteriorColor: String,
        fuel: FuelType,
        imageURL: String
    ) {
        self.brand = brand
        self.model = model
        self.highway = highway
        self.transmission = transmission
        self.engine = engine
        self.bodyStyle = bodyStyle
        self.exteriorColor = exteriorColor
        self.fuel = fuel
        self.imageURL = imageURL
    }
}

enum Brand: String, CaseIterable {
    case bmw = "BMW"
    case audi = "Audi"
    case tesla = "Tesla"
    case geely = "Geely"
    case renault = "Renault"
    case lada = "Lada"
    
    var shopURL: String {
        switch self {
        case .bmw: return "https://www.bmw.com"
        case .audi: return "https://www.audi.com"
        case .tesla: return "https://www.tesla.com"
        case .geely: return "https://www.geely.com"
        case .renault: return "https://www.renault.com"
        case .lada: return "https://www.lada.ru"
        }
    }
}

extension Car {
    var id: String {
        brand.rawValue + model
    }
}
