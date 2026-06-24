// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataSourceMocks",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "DataSourceMocks",
            targets: ["DataSourceMocks"]
        ),
    ],
    dependencies: [
        .package(path: "../../Domain/Entity"),
        .package(path: "../../Domain/Repository"),
    ],
    targets: [
        .target(
            name: "DataSourceMocks",
            dependencies: [
                .product(name: "Entity", package: "Entity"),
                .product(name: "Repository", package: "Repository"),
            ]
        ),

    ],
    swiftLanguageModes: [.v6]
)
