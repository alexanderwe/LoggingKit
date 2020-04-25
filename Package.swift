// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "LoggingKit",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9),
        .watchOS(.v2),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "LoggingKit",
            targets: ["LoggingKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LoggingKit",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "LoggingKitTests",
            dependencies: ["LoggingKit"],
            path: "Tests"
        ),
    ]
)
