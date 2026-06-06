// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Repository",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "Repository", targets: ["Repository"]),
    ],
    dependencies: [
        .package(path: "../Entity")
    ],
    targets: [
        .target(
            name: "Repository",
            dependencies: [
                .product(name: "Entity", package: "Entity")
            ]
        ),

    ],
    swiftLanguageModes: [.v6]
)
