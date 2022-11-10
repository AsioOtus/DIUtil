// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DIUtil",
    products: [
        .library(
            name: "DIUtil",
            targets: ["DIUtil"]
        ),
    ],
    targets: [
        .target(
            name: "DIUtil",
            dependencies: []
        ),
        .executableTarget(
            name: "Testground",
            dependencies: ["DIUtil"]
        ),
        .testTarget(
            name: "DIUtilTests",
            dependencies: ["DIUtil"]
        ),
    ]
)
