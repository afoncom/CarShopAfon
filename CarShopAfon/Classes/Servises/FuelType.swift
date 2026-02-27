//
//  FuelType.swift
//  CarShopAfon
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
            return L10n.FuelType.diesel
        case .gas:
            return L10n.FuelType.gas
        case .gasoline:
            return L10n.FuelType.gasoline
        case .electro:
            return L10n.FuelType.electric
        }
    }
}
