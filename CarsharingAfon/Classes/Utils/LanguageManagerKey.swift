//
//  LanguageManagerKey.swift
//  CarsharingAfon
//
//  Created by afon.com on 26.02.2026.
//

import SwiftUI

private struct LanguageManagerKey: EnvironmentKey {
    static let defaultValue: LanguageManager = LanguageManagerImpl()
}

extension EnvironmentValues {
    var languageManager: LanguageManager {
        get { self[LanguageManagerKey.self] }
        set { self[LanguageManagerKey.self] = newValue }
    }
}
