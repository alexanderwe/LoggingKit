// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "LoggingKit",
    platforms: [
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11),
        .macOS(.v15),
    ],
    products: [
        .library(
            name: "LoggingKit",
            targets: ["LoggingKit"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LoggingKit",
            resources: [
                .process("Resources/PrivacyInfo.xcprivacy")
            ]
        ),
        .testTarget(
            name: "LoggingKitTests",
            dependencies: ["LoggingKit"],
        ),
    ]
)

for target in package.targets {
    target.swiftSettings = target.swiftSettings ?? []
    target.swiftSettings?.append(contentsOf: [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("ImmutableWeakCaptures"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
    ])
}
