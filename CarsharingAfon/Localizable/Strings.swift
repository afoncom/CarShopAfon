//// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen
//// swiftlint:disable all
//
//import Foundation
//
//
//internal enum L10n {
//    
//    internal enum BodyStyle {
//        /// Coupe
//        internal static let coupe = L10n.tr("Localizable", "bodyStyle.coupe")
//        /// Hatchback
//        internal static let hatchback = L10n.tr("Localizable", "bodyStyle.hatchback")
//        /// Sedan
//        internal static let sedan = L10n.tr("Localizable", "bodyStyle.sedan")
//        /// SUV
//        internal static let suv = L10n.tr("Localizable", "bodyStyle.suv")
//        /// Wagon
//        internal static let wagon = L10n.tr("Localizable", "bodyStyle.wagon")
//    }
//    
//    internal enum Button {
//        /// Buy
//        internal static let buy = L10n.tr("Localizable", "button.buy")
//        /// Visit store
//        internal static let visitStore = L10n.tr("Localizable", "button.visitStore")
//    }
//    
//    internal enum FuelType {
//        /// Diesel
//        internal static let diesel = L10n.tr("Localizable", "fuelType.diesel")
//        /// Electric
//        internal static let electric = L10n.tr("Localizable", "fuelType.electric")
//        /// Gas
//        internal static let gas = L10n.tr("Localizable", "fuelType.gas")
//        /// Gasoline
//        internal static let gasoline = L10n.tr("Localizable", "fuelType.gasoline")
//    }
//    
//    internal enum NavigationTitle {
//        /// Account
//        internal static let account = L10n.tr("Localizable", "navigationTitle.account")
//        /// All cars
//        internal static let allCars = L10n.tr("Localizable", "navigationTitle.allCars")
//        /// Characteristic
//        internal static let characteristic = L10n.tr("Localizable", "navigationTitle.characteristic")
//        /// Settings
//        internal static let settings = L10n.tr("Localizable", "navigationTitle.settings")
//    }
//    
//    internal enum Section {
//        /// Preferences
//        internal static let preferences = L10n.tr("Localizable", "section.preferences")
//        /// Support
//        internal static let support = L10n.tr("Localizable", "section.support")
//    }
//    
//    internal enum Text {
//        /// Dark Mode
//        internal static let darkMode = L10n.tr("Localizable", "text.DarkMode")
//        /// English
//        internal static let english = L10n.tr("Localizable", "text.english")
//        /// Error
//        internal static let error = L10n.tr("Localizable", "text.error")
//        /// Free
//        internal static let free = L10n.tr("Localizable", "text.free")
//        /// Language
//        internal static let language = L10n.tr("Localizable", "text.language")
//        /// Loaded
//        internal static let loaded = L10n.tr("Localizable", "text.loaded")
//        /// Price
//        internal static let price = L10n.tr("Localizable", "text.price")
//        /// Rate the app
//        internal static let rateTheApp = L10n.tr("Localizable", "text.rateTheApp")
//        /// Rent
//        internal static let rent = L10n.tr("Localizable", "text.rent")
//        /// Rented is completed
//        internal static let rentedIsCompleted = L10n.tr("Localizable", "text.rentedIsCompleted")
//        /// Russian
//        internal static let russian = L10n.tr("Localizable", "text.russian")
//        /// Send feedback
//        internal static let sendFeedback = L10n.tr("Localizable", "text.sendFeedback")
//        /// Version
//        internal static let version = L10n.tr("Localizable", "text.version")
//    }
//    
//    internal enum Title {
//        /// Body Style
//        internal static let bodyStyle = L10n.tr("Localizable", "title.bodyStyle")
//        /// Engine
//        internal static let engine = L10n.tr("Localizable", "title.engine")
//        /// Exterior Color
//        internal static let exteriorColor = L10n.tr("Localizable", "title.exteriorColor")
//        /// Fuel
//        internal static let fuel = L10n.tr("Localizable", "title.fuel")
//        /// Highway
//        internal static let highway = L10n.tr("Localizable", "title.highway")
//        /// Transmission
//        internal static let transmission = L10n.tr("Localizable", "title.transmission")
//    }
//}
//
//extension L10n {
//    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
//        let fallback = key
//        let format = BundleToken.bundle.localizedString(forKey: key, value: fallback, table: table)
//        
//        return String(format: format, locale: Locale.current, arguments: args)
//    }
//}
//
//private final class BundleToken {}
//
//// swiftlint:enable all
//
//

// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen
// swiftlint:disable all

import Foundation

private enum LanguageCode: String {
    case russian = "ru"
    case english = "en"
    
    static var current: LanguageCode {
        let savedLanguage = UserDefaults.standard.string(forKey: "language")
        if let saved = savedLanguage,
           let language = LanguageCode(rawValue: saved) {
            return language
        }
        return .russian
    }
}

private final class BundleToken {
    static var bundle: Bundle {
        let languageCode = LanguageCode.current.rawValue
        
        if let path = Bundle.main.path(forResource: languageCode, ofType: "lproj"),
           let bundle = Bundle(path: path) {
            return bundle
        }
        
        return Bundle.main
    }
}

// MARK: - L10n Enum
internal enum L10n {
    
    internal enum BodyStyle {
        internal static let coupe = L10n.tr("Localizable", "bodyStyle.coupe")
        internal static let hatchback = L10n.tr("Localizable", "bodyStyle.hatchback")
        internal static let sedan = L10n.tr("Localizable", "bodyStyle.sedan")
        internal static let suv = L10n.tr("Localizable", "bodyStyle.suv")
        internal static let wagon = L10n.tr("Localizable", "bodyStyle.wagon")
    }
    
    internal enum Button {
        internal static let buy = L10n.tr("Localizable", "button.buy")
        internal static let visitStore = L10n.tr("Localizable", "button.visitStore")
    }
    
    internal enum FuelType {
        internal static let diesel = L10n.tr("Localizable", "fuelType.diesel")
        internal static let electric = L10n.tr("Localizable", "fuelType.electric")
        internal static let gas = L10n.tr("Localizable", "fuelType.gas")
        internal static let gasoline = L10n.tr("Localizable", "fuelType.gasoline")
    }
    
    internal enum NavigationTitle {
        internal static let account = L10n.tr("Localizable", "navigationTitle.account")
        internal static let allCars = L10n.tr("Localizable", "navigationTitle.allCars")
        internal static let characteristic = L10n.tr("Localizable", "navigationTitle.characteristic")
        internal static let settings = L10n.tr("Localizable", "navigationTitle.settings")
    }
    
    internal enum Section {
        internal static let preferences = L10n.tr("Localizable", "section.preferences")
        internal static let support = L10n.tr("Localizable", "section.support")
    }
    
    internal enum Text {
        internal static let darkMode = L10n.tr("Localizable", "text.DarkMode")
        internal static let english = L10n.tr("Localizable", "text.english")
        internal static let error = L10n.tr("Localizable", "text.error")
        internal static let free = L10n.tr("Localizable", "text.free")
        internal static let language = L10n.tr("Localizable", "text.language")
        internal static let loaded = L10n.tr("Localizable", "text.loaded")
        internal static let price = L10n.tr("Localizable", "text.price")
        internal static let rateTheApp = L10n.tr("Localizable", "text.rateTheApp")
        internal static let rent = L10n.tr("Localizable", "text.rent")
        internal static let rentedIsCompleted = L10n.tr("Localizable", "text.rentedIsCompleted")
        internal static let russian = L10n.tr("Localizable", "text.russian")
        internal static let sendFeedback = L10n.tr("Localizable", "text.sendFeedback")
        internal static let version = L10n.tr("Localizable", "text.version")
    }
    
    internal enum Title {
        internal static let bodyStyle = L10n.tr("Localizable", "title.bodyStyle")
        internal static let engine = L10n.tr("Localizable", "title.engine")
        internal static let exteriorColor = L10n.tr("Localizable", "title.exteriorColor")
        internal static let fuel = L10n.tr("Localizable", "title.fuel")
        internal static let highway = L10n.tr("Localizable", "title.highway")
        internal static let transmission = L10n.tr("Localizable", "title.transmission")
    }
}

// MARK: - Implementation Details
extension L10n {
    fileprivate static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let fallback = key
        let format = BundleToken.bundle.localizedString(forKey: key, value: fallback, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

// swiftlint:enable all
