//
//  Language.swift
//  CarsharingAfon
//
//  Created by afon.com on 26.02.2026.
//

import Foundation

enum Language: String, CaseIterable {
    case russian = "ru"
    case english = "en"
    
    var displayName: String {
        switch self {
        case .russian:
            return L10n.Text.russian
        case .english:
            return L10n.Text.english
        }
    }
}
