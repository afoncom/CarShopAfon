//
//  FuelType.swift
//  CarsharingAfon
//
//  Created by afon.com on 16.02.2026.
//

import Foundation

enum FuelType: Codable {
    case diesel
    case gas
    case gasoline
    case electro
    
    var name: String {
        switch self {
        case .diesel:
            return "Diesel"
        case .gas:
            return "Gas"
        case .gasoline:
            return "Gasoline"
        case .electro:
            return "Electric"
        }
    }
}
