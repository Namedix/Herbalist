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
        .library(name: "Common", targets: ["Common"]),
        .library(name: "Profile", targets: ["Profile"])
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["Common", "Profile"]),
        .target(name: "Common", plugins: [.plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")]),
        .target(name: "Profile")
    ]
)
