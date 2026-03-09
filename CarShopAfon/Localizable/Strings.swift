// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen
// swiftlint:disable all

import Foundation


internal enum L10n {

  internal enum BodyStyle {
    /// Coupe
    internal static let coupe = L10n.tr("Localizable", "bodyStyle.coupe")
    /// Hatchback
    internal static let hatchback = L10n.tr("Localizable", "bodyStyle.hatchback")
    /// Sedan
    internal static let sedan = L10n.tr("Localizable", "bodyStyle.sedan")
    /// SUV
    internal static let suv = L10n.tr("Localizable", "bodyStyle.suv")
    /// Wagon
    internal static let wagon = L10n.tr("Localizable", "bodyStyle.wagon")
  }

  internal enum Button {
    /// Buy
    internal static let buy = L10n.tr("Localizable", "button.buy")
    /// Edit
    internal static let edit = L10n.tr("Localizable", "button.edit")
    /// Visit store
    internal static let visitStore = L10n.tr("Localizable", "button.visitStore")
  }

  internal enum FuelType {
    /// Diesel
    internal static let diesel = L10n.tr("Localizable", "fuelType.diesel")
    /// Electric
    internal static let electric = L10n.tr("Localizable", "fuelType.electric")
    /// Gas
    internal static let gas = L10n.tr("Localizable", "fuelType.gas")
    /// Gasoline
    internal static let gasoline = L10n.tr("Localizable", "fuelType.gasoline")
  }

  internal enum NavigationTitle {
    /// Account
    internal static let account = L10n.tr("Localizable", "navigationTitle.account")
    /// All cars
    internal static let allCars = L10n.tr("Localizable", "navigationTitle.allCars")
    /// Characteristic
    internal static let characteristic = L10n.tr("Localizable", "navigationTitle.characteristic")
    /// Settings
    internal static let settings = L10n.tr("Localizable", "navigationTitle.settings")
  }

  internal enum Section {
    /// Preferences
    internal static let preferences = L10n.tr("Localizable", "section.preferences")
    /// Support
    internal static let support = L10n.tr("Localizable", "section.support")
  }

  internal enum Text {
    /// Dark Mode
    internal static let darkMode = L10n.tr("Localizable", "text.DarkMode")
    /// English
    internal static let english = L10n.tr("Localizable", "text.english")
    /// Error
    internal static let error = L10n.tr("Localizable", "text.error")
    /// Exit
    internal static let exit = L10n.tr("Localizable", "text.exit")
    /// Free
    internal static let free = L10n.tr("Localizable", "text.free")
    /// Language
    internal static let language = L10n.tr("Localizable", "text.language")
    /// Loaded
    internal static let loaded = L10n.tr("Localizable", "text.loaded")
    /// Notifications
    internal static let notifications = L10n.tr("Localizable", "text.notifications")
    /// Price
    internal static let price = L10n.tr("Localizable", "text.price")
    /// Privacy
    internal static let privacy = L10n.tr("Localizable", "text.privacy")
    /// Rate the app
    internal static let rateTheApp = L10n.tr("Localizable", "text.rateTheApp")
    /// Rent
    internal static let rent = L10n.tr("Localizable", "text.rent")
    /// Rented is completed
    internal static let rentedIsCompleted = L10n.tr("Localizable", "text.rentedIsCompleted")
    /// Russian
    internal static let russian = L10n.tr("Localizable", "text.russian")
    /// Send feedback
    internal static let sendFeedback = L10n.tr("Localizable", "text.sendFeedback")
    /// Username
    internal static let username = L10n.tr("Localizable", "text.username")
    /// Version
    internal static let version = L10n.tr("Localizable", "text.version")
  }

  internal enum Title {
    /// Body Style
    internal static let bodyStyle = L10n.tr("Localizable", "title.bodyStyle")
    /// Engine
    internal static let engine = L10n.tr("Localizable", "title.engine")
    /// Exterior Color
    internal static let exteriorColor = L10n.tr("Localizable", "title.exteriorColor")
    /// Fuel
    internal static let fuel = L10n.tr("Localizable", "title.fuel")
    /// Highway
    internal static let highway = L10n.tr("Localizable", "title.highway")
    /// Transmission
    internal static let transmission = L10n.tr("Localizable", "title.transmission")
  }
}

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

// swiftlint:enable all
