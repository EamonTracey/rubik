// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Rubik",
    products: [
        .library(
            name: "Rubik",
            targets: ["Rubik"]
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
            name: "Rubik",
            dependencies: [.product(name: "Collections", package: "swift-collections")],
            resources: [.copy("Tables/")]
        ),
        .testTarget(
            name: "RubikTests",
            dependencies: ["Rubik"]
        )
    ]
)
