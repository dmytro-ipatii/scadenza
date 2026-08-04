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
        .package(path: "../EntityFixtures"),
        .package(path: "../Repository"),
        .package(path: "../../Data/DataSourceMocks"),
    ],
    targets: [
        .target(
            name: "UseCase",
            dependencies: [
                .product(name: "Entity", package: "Entity"),
                .product(name: "Repository", package: "Repository"),
            ],
        ),
        .testTarget(
            name: "UseCaseTests",
            dependencies: [
                "UseCase",
                .product(name: "Entity", package: "Entity"),
                .product(name: "EntityFixtures", package: "EntityFixtures"),
                .product(name: "Repository", package: "Repository"),
                .product(name: "DataSourceMocks", package: "DataSourceMocks"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
