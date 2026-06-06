// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UseCase",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "UseCase", targets: ["UseCase"]),
    ],
    dependencies: [
        .package(path: "../Entity"),
        .package(path: "../Repository"),
    ],
    targets: [
        .target(
            name: "UseCase",
            dependencies: [
                .product(name: "Entity", package: "Entity"),
                .product(name: "Repository", package: "Repository"),
            ],
        ),

    ],
    swiftLanguageModes: [.v6]
)
