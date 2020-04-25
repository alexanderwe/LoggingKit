// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "LoggingKit",
    platforms: [
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3),
        .macOS(.v10_12)
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
