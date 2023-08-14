// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Herbalist",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(name: "App", targets: ["App"]),
    ],
    targets: [
        .target(name: "App"),
    ]
)
