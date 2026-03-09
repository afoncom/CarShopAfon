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
    
    private let dieselCarManager = DieselCarManager(
        listCar: [
            RegularCar(
                brand: .bmw,
                model: "X5 xDrive40i",
                highway: "9.3 L",
                transmission: "8-speed",
                engine: "3.0L I6 375 hp",
                bodyStyle: .suv,
                exteriorColor: "Black",
                fuel: .diesel,
                imageURL: "https://i.ibb.co/cXhFMxfr/2026-03-05-21-31-47.png"
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
                imageURL: "https://i.ibb.co/BV70xjQg/2026-03-05-22-15-29.png"
            )
        ]
    )
    
    private let gasolineCarManager = GasolineCarManager(
        cars: [
            RegularCar(
                brand: .geely,
                model: "Coolray",
                highway: "7.1 L",
                transmission: "7-speed",
                engine: "1.5L I4 172 hp",
                bodyStyle: .suv,
                exteriorColor: "White",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/PZB12G2v/2026-03-05-22-45-11.png"
            ),
            RegularCar(
                brand: .renault,
                model: "Logan",
                highway: "6.8 L",
                transmission: "5-speed",
                engine: "1.4L I4 72 hp",
                bodyStyle: .sedan,
                exteriorColor: "Black",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/XZhnzgLq/png-klev-club-w7ik-p-reno-logan-png-11.png"
            ),
            RegularCar(
                brand: .lada,
                model: "Vesta",
                highway: "7.3 L",
                transmission: "5-speed",
                engine: "1.6L I4 106 hp",
                bodyStyle: .sedan,
                exteriorColor: "Gray",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/PvXgZn38/png-klev-club-ojmx-p-lada-vesta-png-12.png"
            ),
            RegularCar(
                brand: .bmw,
                model: "M3 Competition",
                highway: "10.4 L",
                transmission: "8-speed",
                engine: "3.0L I6 530 hp",
                bodyStyle: .sedan,
                exteriorColor: "Black",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/Z1vfxybV/2026-03-05-21-20-43.png"
            ),
            RegularCar(
                brand: .audi,
                model: "A8 L 55 TFSI",
                highway: "9.5 L",
                transmission: "8-speed",
                engine: "3.0L V6 335 hp",
                bodyStyle: .sedan,
                exteriorColor: "Everest White",
                fuel: .gasoline,
                imageURL: "https://i.ibb.co/chZdH3GL/audi-a8-white.png"
            )
        ]
    )
    
    private let electroCarManager = ElectroCarManager(
        cars: [
            RegularCar(
                brand: .tesla,
                model: "Model 3",
                highway: "5.6 km/kWh",
                transmission: "1-speed",
                engine: "Electric Motor 346 hp",
                bodyStyle: .sedan,
                exteriorColor: "Black",
                fuel: .electro,
                imageURL: "https://i.ibb.co/DHDdXH94/Tesla-Model3.png"
            )
        ]
    )
    
    private var carManagers: [CarManager] {
        [dieselCarManager, gasolineCarManager, electroCarManager]
    }
    
    let themeManager: ThemeManager = ThemeManagerImpl()
    let mailService: MailService = MailServiceImpl()
    var agregator: Agregator {
        AgregatorImpl(carManagers: carManagers)
    }
}

extension AppAssemblyImpl: SettingsAssembly {
    
}
