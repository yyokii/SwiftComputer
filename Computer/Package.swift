// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Computer",
    products: [
        .library(
            name: "Computer",
            targets: ["Computer"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Computer",
            dependencies: [
                "Hardware",
                "Software"
            ]),
        .target(
            name: "Hardware",
            dependencies: []),
        .target(
            name: "Software",
            dependencies: []),
        
        // Test
        .testTarget(
            name: "ComputerTests",
            dependencies: ["Computer"]),
        .testTarget(
            name: "HardwareTests",
            dependencies: ["Hardware"]),
    ]
)
