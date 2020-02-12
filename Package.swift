// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bean",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "Bean",
            targets: ["Bean"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "Bean",
            dependencies: [], path: "Bean"),
        .testTarget(
            name: "BeanTests",
            dependencies: ["Bean"], path: "BeanTests"),
    ]
)
