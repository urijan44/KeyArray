// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KeyArray",
    products: [
        .library(
            name: "KeyArray",
            targets: ["KeyArray"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "KeyArray",
            dependencies: []),
        .testTarget(
            name: "KeyArrayTests",
            dependencies: ["KeyArray"]),
    ]
)
