// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Krokus",
    products: [
        .library(
            name: "Krokus",
            targets: ["Krokus"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MoveUpwardsDev/EventSource.git", from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "Krokus",
            dependencies: ["EventSource"]),
        .testTarget(
            name: "KrokusTests",
            dependencies: ["Krokus"]),
    ]
)
