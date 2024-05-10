// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "AlphaVantage",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .tvOS(.v17), .macOS(.v14), .watchOS(.v10), .macCatalyst(.v17), .visionOS(.v1)],
    products: [
      .library(name: "AlphaVantage", targets: ["AlphaVantage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wmalloc/HTTPRequestable.git", from: "0.7.0"),
        .package(url: "https://github.com/apple/swift-http-types.git", from: "1.0.3"),
    ],
    targets: [
      .target(name: "AlphaVantage", dependencies: ["HTTPRequestable",
                                                   .product(name: "HTTPTypes", package: "swift-http-types"),
                                                   .product(name: "HTTPTypesFoundation", package: "swift-http-types")]),
        .testTarget(name: "AlphaVantageTests", dependencies: ["AlphaVantage", "HTTPRequestable",
                                                              .product(name: "HTTPTypes", package: "swift-http-types"),
                                                              .product(name: "HTTPTypesFoundation", package: "swift-http-types")],
                    resources: [.copy("TestData")]),
    ]
)
