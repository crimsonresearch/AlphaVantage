// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlphaVantage",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .tvOS(.v17), .macOS(.v14), .watchOS(.v10), .macCatalyst(.v17), .visionOS(.v1)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "AlphaVantage", targets: ["AlphaVantage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wmalloc/URLRequestable.git", from: "0.5.0"),
        .package(url: "https://github.com/apple/swift-http-types.git", from: "1.0.1"),
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.54.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
      .target(name: "AlphaVantage", dependencies: ["URLRequestable",
                                                   .product(name: "HTTPTypes", package: "swift-http-types"),
                                                   .product(name: "HTTPTypesFoundation", package: "swift-http-types")],
              plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLint")]),
        .testTarget(name: "AlphaVantageTests", dependencies: ["AlphaVantage", "URLRequestable",
                                                              .product(name: "HTTPTypes", package: "swift-http-types"),
                                                              .product(name: "HTTPTypesFoundation", package: "swift-http-types")],
                    resources: [.copy("TestData")]),
    ]
)
