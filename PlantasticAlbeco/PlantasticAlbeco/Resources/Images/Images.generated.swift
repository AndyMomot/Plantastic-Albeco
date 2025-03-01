// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let bear = ImageAsset(name: "bear")
  internal static let beaver = ImageAsset(name: "beaver")
  internal static let calendar = ImageAsset(name: "calendar")
  internal static let camera = ImageAsset(name: "camera")
  internal static let clip = ImageAsset(name: "clip")
  internal static let daysCompleted = ImageAsset(name: "daysCompleted")
  internal static let healthTask = ImageAsset(name: "healthTask")
  internal static let leaf = ImageAsset(name: "leaf")
  internal static let leafsCompleted = ImageAsset(name: "leafsCompleted")
  internal static let moose = ImageAsset(name: "moose")
  internal static let personalTask = ImageAsset(name: "personalTask")
  internal static let rewardsBg = ImageAsset(name: "rewardsBg")
  internal static let tasks = ImageAsset(name: "tasks")
  internal static let tasksBg = ImageAsset(name: "tasksBg")
  internal static let tasksCompleted = ImageAsset(name: "tasksCompleted")
  internal static let task0 = ImageAsset(name: "task0")
  internal static let task1 = ImageAsset(name: "task1")
  internal static let task10 = ImageAsset(name: "task10")
  internal static let task11 = ImageAsset(name: "task11")
  internal static let task12 = ImageAsset(name: "task12")
  internal static let task13 = ImageAsset(name: "task13")
  internal static let task14 = ImageAsset(name: "task14")
  internal static let task15 = ImageAsset(name: "task15")
  internal static let task16 = ImageAsset(name: "task16")
  internal static let task17 = ImageAsset(name: "task17")
  internal static let task18 = ImageAsset(name: "task18")
  internal static let task19 = ImageAsset(name: "task19")
  internal static let task2 = ImageAsset(name: "task2")
  internal static let task20 = ImageAsset(name: "task20")
  internal static let task21 = ImageAsset(name: "task21")
  internal static let task22 = ImageAsset(name: "task22")
  internal static let task23 = ImageAsset(name: "task23")
  internal static let task24 = ImageAsset(name: "task24")
  internal static let task25 = ImageAsset(name: "task25")
  internal static let task26 = ImageAsset(name: "task26")
  internal static let task27 = ImageAsset(name: "task27")
  internal static let task28 = ImageAsset(name: "task28")
  internal static let task29 = ImageAsset(name: "task29")
  internal static let task3 = ImageAsset(name: "task3")
  internal static let task30 = ImageAsset(name: "task30")
  internal static let task31 = ImageAsset(name: "task31")
  internal static let task32 = ImageAsset(name: "task32")
  internal static let task33 = ImageAsset(name: "task33")
  internal static let task34 = ImageAsset(name: "task34")
  internal static let task35 = ImageAsset(name: "task35")
  internal static let task36 = ImageAsset(name: "task36")
  internal static let task37 = ImageAsset(name: "task37")
  internal static let task38 = ImageAsset(name: "task38")
  internal static let task39 = ImageAsset(name: "task39")
  internal static let task4 = ImageAsset(name: "task4")
  internal static let task40 = ImageAsset(name: "task40")
  internal static let task41 = ImageAsset(name: "task41")
  internal static let task42 = ImageAsset(name: "task42")
  internal static let task43 = ImageAsset(name: "task43")
  internal static let task44 = ImageAsset(name: "task44")
  internal static let task45 = ImageAsset(name: "task45")
  internal static let task46 = ImageAsset(name: "task46")
  internal static let task47 = ImageAsset(name: "task47")
  internal static let task48 = ImageAsset(name: "task48")
  internal static let task49 = ImageAsset(name: "task49")
  internal static let task5 = ImageAsset(name: "task5")
  internal static let task50 = ImageAsset(name: "task50")
  internal static let task6 = ImageAsset(name: "task6")
  internal static let task7 = ImageAsset(name: "task7")
  internal static let task8 = ImageAsset(name: "task8")
  internal static let task9 = ImageAsset(name: "task9")
  internal static let workTask = ImageAsset(name: "workTask")
  internal static let сhristmasTree = ImageAsset(name: "сhristmasTree")
  internal static let logo = ImageAsset(name: "logo")
  internal static let onboard1 = ImageAsset(name: "onboard1")
  internal static let onboard2 = ImageAsset(name: "onboard2")
  internal static let onboard3 = ImageAsset(name: "onboard3")
  internal static let loager = ImageAsset(name: "loager")
  internal static let preloader = ImageAsset(name: "preloader")
  internal static let tab1 = ImageAsset(name: "tab1")
  internal static let tab1s = ImageAsset(name: "tab1s")
  internal static let tab2 = ImageAsset(name: "tab2")
  internal static let tab2s = ImageAsset(name: "tab2s")
  internal static let tab3 = ImageAsset(name: "tab3")
  internal static let tab3s = ImageAsset(name: "tab3s")
  internal static let tab4 = ImageAsset(name: "tab4")
  internal static let tab4s = ImageAsset(name: "tab4s")
  internal static let tab5 = ImageAsset(name: "tab5")
  internal static let tab5s = ImageAsset(name: "tab5s")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
