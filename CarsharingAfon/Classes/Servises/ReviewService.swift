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
    private let reviewRouter: ReviewRouter
    
    init(reviewRouter: ReviewRouter) {
        self.reviewRouter = reviewRouter
    }
    
    func requestAppReview() {
        reviewRouter.requestReview()
    }
}
