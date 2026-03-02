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
                model: "M3",
                highway: "20/27 MPG",
                transmission: "9-speed",
                engine: "6 Cyl - 3.5 L",
                bodyStyle: .sedan,
                exteriorColor: "White",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/hFjG2GrM/BMW-M3.jpg"
            ),
            RegularCar(
                brand: .bmw,
                model: "X5",
                highway: "20/27 MPG",
                transmission: "9-speed",
                engine: "6 Cyl - 3.5 L",
                bodyStyle: .suv,
                exteriorColor: "Black",
                fuel: .diesel,
                imageURL: "https://i.ibb.co/1tJ8cvzD/BMW-X5.jpg"
            ),
            RegularCar(
                brand: .audi,
                model: "A8",
                highway: "20/27 MPG",
                transmission: "9-speed",
                engine: "6 Cyl - 3.5 L",
                bodyStyle: .sedan,
                exteriorColor: "Everest White",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/chZdH3GL/audi-a8-white.png"
            ),
            RegularCar(
                brand: .audi,
                model: "A5",
                highway: "20/27 MPG",
                transmission: "9-speed",
                engine: "6 Cyl - 3.5 L",
                bodyStyle: .coupe,
                exteriorColor: "Green",
                fuel: .diesel,
                imageURL:"https://i.ibb.co/FbPwq2pz/Audi-A5-Green.jpg"
            )
        ]
    )
    
    private let carManager2 = CarManager2(
        cars: [
            RegularCar(
                brand: .geely,
                model: "Coolry",
                highway: "20/27 MPG",
                transmission: "9-speed",
                engine: "6 Cyl - 3.5 L",
                bodyStyle: .suv,
                exteriorColor: "Cherry Burgundy",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/9Hftb2zQ/car-22.png"
            ),
            RegularCar(
                brand: .tesla,
                model: "Model3",
                highway: "20/27 MPG",
                transmission: "9-speed",
                engine: "6 Cyl - 3.5 L",
                bodyStyle: .sedan,
                exteriorColor: "Gray",
                fuel: .electro,
                imageURL: "https://i.ibb.co/TBvHFSC0/TTesscla.png"
            ),
            RegularCar(
                brand: .renault,
                model: "Logan",
                highway: "20/27 MPG",
                transmission: "9-speed",
                engine: "6 Cyl - 3.5 L",
                bodyStyle: .sedan,
                exteriorColor: "Red",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/Kc8jnPbV/Reno-logan-red.png"
            ),
            RegularCar(
                brand: .lada,
                model: "Vesta",
                highway: "20/27 MPG",
                transmission: "9-speed",
                engine: "6 Cyl - 3.5 L",
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

extension AppAssemblyImpl: SettingAssembly {
    
}
