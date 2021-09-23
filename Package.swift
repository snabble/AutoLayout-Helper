// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AutoLayout-Helper",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "AutoLayout-Helper",
            targets: ["AutoLayout-Helper"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AutoLayout-Helper",
            dependencies: []),
        .testTarget(
            name: "AutoLayout-HelperTests",
            dependencies: ["AutoLayout-Helper"]),
    ]
)
