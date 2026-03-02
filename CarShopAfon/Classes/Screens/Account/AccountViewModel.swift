//
//  AccountViewModel.swift
//  CarShopAfon
//
//  Created by afon.com on 27.02.2026.
//

import Foundation
import Combine

enum AccountViewState {
    case loading
    case loaded
    case error
}

final class AccountViewModel: ObservableObject {
    @Published var viewState: AccountScreen.ViewState = .loading
    
}
