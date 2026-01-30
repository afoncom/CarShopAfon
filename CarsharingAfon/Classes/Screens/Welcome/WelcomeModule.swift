//
//  WelcomeModule.swift
//  CarsharingAfon
//
//  Created by afon.com on 30.01.2026.
//

import SwiftUI

final class WelcomeModule {
    static func build(
        coordinator: AppCoordinator
    ) -> some View {
        let presenter = WelcomePresenterImpl(coordinator: coordinator)
        
        return WelcomeScreen(presenter: presenter)
    }
}
