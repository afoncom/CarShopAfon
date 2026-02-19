// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen
// swiftlint:disable all

import Foundation


internal enum L10n {

  internal enum Button {
    /// Buy
    internal static let buy = L10n.tr("Localizable", "button.buy")
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
