// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EntityFixtures",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "EntityFixtures",
            targets: ["EntityFixtures"]
        ),
    ],
    dependencies: [
        .package(path: "../Entity")
    ],
    targets: [

        .target(
            name: "EntityFixtures",
            dependencies: [
                .product(name: "Entity", package: "Entity")
            ]
        ),

    ],
    swiftLanguageModes: [.v6]
)
