// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DI",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "DI",
            targets: ["DI"]
        ),
    ],
    dependencies: [
        // Data
        .package(path: "../Data/DataSource"),

        // Domain
        .package(path: "../Domain/Entity"),
        .package(path: "../Domain/Repository"),
        .package(path: "../Domain/UseCase"),

        // Presentation
        .package(path: "../Presentation/Presentation"),
    ],
    targets: [
        .target(
            name: "DI",
            dependencies: [
                // Data
                .product(name: "DataSource", package: "DataSource"),

                // Domain
                .product(name: "Entity", package: "Entity"),
                .product(name: "Repository", package: "Repository"),
                .product(name: "UseCase", package: "UseCase"),

                // Presentation
                .product(name: "Presentation", package: "Presentation"),
            ]
        ),

    ],
    swiftLanguageModes: [.v6]
)
