// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataSource",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "DataSource", targets: ["DataSource"]),
    ],
    dependencies: [
        .package(path: "../Domain/Repository"),
        .package(path: "../Domain/Entity"),
    ],
    targets: [
        .target(
            name: "DataSource",
            dependencies: [
                .product(name: "Repository", package: "Repository"),
                .product(name: "Entity", package: "Entity"),
            ],
        ),

    ],
    swiftLanguageModes: [.v6]
)
