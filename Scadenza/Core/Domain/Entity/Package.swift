// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Entity",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "Entity",
            targets: ["Entity"]
        ),
    ],
    targets: [
        .target(
            name: "Entity"
        ),

    ],
    swiftLanguageModes: [.v6]
)
