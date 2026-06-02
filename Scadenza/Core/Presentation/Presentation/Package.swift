// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Presentation",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "Presentation",
            targets: ["Presentation"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain/Entity"),
        .package(path: "../Domain/UseCase"),
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: [
                .product(name: "Entity", package: "Entity"),
                .product(name: "UseCase", package: "UseCase"),
            ],
        ),

    ],
    swiftLanguageModes: [.v6]
)
