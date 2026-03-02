//
//  Assembly.swift
//  CarShopAfon
//
//  Created by afon.com on 21.01.2026.
//

import Foundation


protocol AppAssembly {
    var agregator: Agregator { get }
}

final class AppAssemblyImpl: AppAssembly {
    
    private let carManager1 = CarManagerImpl(
        listCar: [
            RegularCar(
                brand: .bmw,
                model: "M3 Competition",
                highway: "10.4 L",
                transmission: "8-speed",
                engine: "3.0L I6 530 hp",
                bodyStyle: .sedan,
                exteriorColor: "White",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/hFjG2GrM/BMW-M3.jpg"
            ),
            RegularCar(
                brand: .bmw,
                model: "X5 xDrive40i",
                highway: "9.3 L",
                transmission: "8-speed",
                engine: "3.0L I6 375 hp",
                bodyStyle: .suv,
                exteriorColor: "Black",
                fuel: .diesel,
                imageURL: "https://i.ibb.co/1tJ8cvzD/BMW-X5.jpg"
            ),
            RegularCar(
                brand: .audi,
                model: "A8 L 55 TFSI",
                highway: "22 MPG",
                transmission: "8-speed",
                engine: "3.0L V6 335 hp",
                bodyStyle: .sedan,
                exteriorColor: "Everest White",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/chZdH3GL/audi-a8-white.png"
            ),
            RegularCar(
                brand: .audi,
                model: "A5 3.0 TDI",
                highway: "7.2 L",
                transmission: "6-speed",
                engine: "3.0L V6 237 hp",
                bodyStyle: .coupe,
                exteriorColor: "Green",
                fuel: .diesel,
                imageURL: "https://i.ibb.co/FbPwq2pz/Audi-A5-Green.jpg"
            )
        ]
    )
    
    private let carManager2 = CarManager2(
        cars: [
            RegularCar(
                brand: .geely,
                model: "Coolray",
                highway: "7.1 L",
                transmission: "7-speed",
                engine: "1.5L I4 172 hp",
                bodyStyle: .suv,
                exteriorColor: "Cherry Burgundy",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/9Hftb2zQ/car-22.png"
            ),
            RegularCar(
                brand: .tesla,
                model: "Model 3",
                highway: "5.6 km/kWh",
                transmission: "1-speed",
                engine: "Electric Motor 346 hp",
                bodyStyle: .sedan,
                exteriorColor: "Gray",
                fuel: .electro,
                imageURL: "https://i.ibb.co/TBvHFSC0/TTesscla.png"
            ),
            RegularCar(
                brand: .renault,
                model: "Logan",
                highway: "6.8 L",
                transmission: "5-speed",
                engine: "1.4L I4 72 hp",
                bodyStyle: .sedan,
                exteriorColor: "Red",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/Kc8jnPbV/Reno-logan-red.png"
            ),
            RegularCar(
                brand: .lada,
                model: "Vesta",
                highway: "7.3 L",
                transmission: "5-speed",
                engine: "1.6L I4 106 hp",
                bodyStyle: .sedan,
                exteriorColor: "Total Black",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/27QfwDwH/Lada-Vesta.png"
            )
        ]
    )
    
    private let electricCarManager = ElectrickCarManager(cars: [])
    private var carManagers: [CarManager] {
        [carManager1, carManager2, electricCarManager]
    }
    
    private var carStatusProvider: CarStatusProvider {
        CarStatusProviderImpl(carManagers: carManagers)
    }
    let themeManager: ThemeManager = ThemeManagerImpl()
    var languageManager: LanguageManager = LanguageManagerImpl()
    var agregator: Agregator {
        AgregatorImpl(carManagers: carManagers)
    }
}

extension AppAssemblyImpl: SettingsAssembly {
    
}
