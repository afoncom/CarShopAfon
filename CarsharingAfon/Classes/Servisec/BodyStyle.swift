//
//  BodyStyle.swift
//  CarsharingAfon
//
//  Created by afon.com on 16.02.2026.
//

import Foundation

enum BodyStyle: Codable {
    case sedan
    case hatchback
    case suv
    case coupe
    case wagon
    
    var name: String {
        switch self {
        case .sedan:
            return "Sedan"
        case .hatchback:
            return "Hatchback"
        case .suv:
            return "SUV"
        case .coupe:
            return "Coupe"
        case .wagon:
            return "Wagon"
        }
    }
}
