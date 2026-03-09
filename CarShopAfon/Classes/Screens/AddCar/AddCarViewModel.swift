//
//  AddCarViewModel.swift
//  CarShopAfon
//
//  Created by afon.com on 25.01.2026.
//

import Foundation
import Observation

@Observable final class AddCarViewModel {
    var viewState: AddCarScreen.ViewState = .loaded
    
    var brand = ""
    var model = ""
    var highway = ""
    var transmission = ""
    var engine = ""
    var bodyStyle = ""
    var exteriorColor = ""
    var fuel = ""
    var imageURL = ""
}
