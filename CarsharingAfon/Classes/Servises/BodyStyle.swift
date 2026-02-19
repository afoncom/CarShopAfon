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
            return L10n.BodyStyle.sedan
        case .hatchback:
            return L10n.BodyStyle.hatchback
        case .suv:
            return L10n.BodyStyle.suv
        case .coupe:
            return L10n.BodyStyle.coupe
        case .wagon:
            return L10n.BodyStyle.wagon
        }
    }
}
