// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Cubik",
    products: [
        .library(
            name: "Cubik",
            targets: ["Cubik"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections.git",
            .upToNextMajor(from: "1.0.0")
        )
    ],
    targets: [
        .target(
            name: "Cubik",
            resources: [.copy("Tables/")]
        ),
        .testTarget(
            name: "CubikTests",
            dependencies: ["Cubik"]
        ),
        .executableTarget(
            name: "CubikTables",
            dependencies: [
                .product(name: "Collections", package: "swift-collections"),
                "Cubik"
            ]
        )
    ]
)
