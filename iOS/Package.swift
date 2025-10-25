// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HelloWorldiOS",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "HelloWorldiOS",
            targets: ["HelloWorldiOS"]),
    ],
    targets: [
        .target(
            name: "HelloWorldiOS",
            path: "HelloWorldiOS"
        ),
    ]
)
