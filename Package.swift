// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MagPageControl",
    products: [
        .library(
            name: "MagPageControl",
            targets: ["MagPageControl"]),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "MagPageControl",
            dependencies: [],
            path: "MagPageControl")
    ]
)
