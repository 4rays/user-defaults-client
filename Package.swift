// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "UserDefaultsClient",
  platforms: [
    .macOS(.v13),
    .iOS(.v17),
    .watchOS(.v9),
    .tvOS(.v17),
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "UserDefaultsClient",
      targets: ["UserDefaultsClient"])
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.4.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "UserDefaultsClient",
      dependencies: [
        .product(name: "Dependencies", package: "swift-dependencies"),
        .product(name: "DependenciesMacros", package: "swift-dependencies"),
      ]
    ),
    .testTarget(
      name: "UserDefaultsClientTests",
      dependencies: ["UserDefaultsClient"]
    ),
  ],
  swiftLanguageModes: [.v6]
)
