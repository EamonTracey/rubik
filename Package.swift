// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Cubik",
    products: [
        .library(
            name: "Cubik",
            targets: ["Cubik"]
        ),
        .executable(
            name: "cubik",
            targets: ["CubikCLI"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections.git",
            .upToNextMajor(from: "1.0.0")
        ),
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            .upToNextMajor(from: "1.2.0")
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
        ),
        .executableTarget(
            name: "CubikCLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Cubik"
            ]
        )
    ]
)
