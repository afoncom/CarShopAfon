//
//  ReviewService.swift
//  CarsharingAfon
//
//  Created by afon.com on 23.02.2026.
//

import StoreKit

protocol ReviewService {
    func requestAppReview()
}

final class ReviewServiceImpl: ReviewService {
    func requestAppReview() {
        if let scene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            AppStore.requestReview(in: scene)
        }
    }
}
