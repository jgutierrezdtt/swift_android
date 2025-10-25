// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "HelloWorld",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
    ],
    products: [
        .executable(
            name: "HelloWorld",
            targets: ["HelloWorld"]
        ),
    ],
    targets: [
        .executableTarget(
            name: "HelloWorld",
            path: "app/src",
            sources: ["main.swift"]
        ),
    ]
)
