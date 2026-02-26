//
//  ReviewRouter.swift
//  CarsharingAfon
//
//  Created by afon.com on 26.02.2026.
//

import StoreKit

protocol ReviewRouter {
    func requestReview()
}

final class ReviewRouterImpl: ReviewRouter {
    func requestReview() {
        if let scene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            AppStore.requestReview(in: scene)
        }
    }
}
