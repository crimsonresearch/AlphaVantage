// swift-tools-version:5.10

import PackageDescription

let swiftSettings: [SwiftSetting] = [
  .enableUpcomingFeature("BareSlashRegexLiterals"),
  .enableUpcomingFeature("ConciseMagicFile"),
  .enableUpcomingFeature("ExistentialAny"),
  .enableUpcomingFeature("ForwardTrailingClosures"),
  .enableUpcomingFeature("ImplicitOpenExistentials"),
  .enableUpcomingFeature("StrictConcurrency"),
  .unsafeFlags(["-warn-concurrency", "-enable-actor-data-race-checks"]),
]

let package = Package(
  name: "AlphaVantage",
  defaultLocalization: "en",
  platforms: [.iOS(.v17), .tvOS(.v17), .macOS(.v14), .watchOS(.v10), .macCatalyst(.v17), .visionOS(.v1)],
  products: [
    .library(name: "AlphaVantage", targets: ["AlphaVantage"]),
  ],
  dependencies: [
    .package(url: "https://github.com/wmalloc/HTTPRequestable.git", branch: "feature/Concurrency"),
    .package(url: "https://github.com/apple/swift-http-types.git", from: "1.0.3"),
  ],
  targets: [
    .target(name: "AlphaVantage", dependencies: ["HTTPRequestable",
                                                 .product(name: "HTTPTypes", package: "swift-http-types"),
                                                 .product(name: "HTTPTypesFoundation", package: "swift-http-types")],
            resources: [.process("Resources")], swiftSettings: swiftSettings),
    .testTarget(name: "AlphaVantageTests", dependencies: ["AlphaVantage", "HTTPRequestable",
                                                          .product(name: "HTTPTypes", package: "swift-http-types"),
                                                          .product(name: "HTTPTypesFoundation", package: "swift-http-types")],
                resources: [.copy("TestData")]),
  ]
)
