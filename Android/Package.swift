// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HelloWorldAndroid",
    platforms: [
        .custom("android", versionString: "24")
    ],
    targets: [
        .executableTarget(
            name: "HelloWorldAndroid",
            path: "app/src/main/swift"
        ),
    ]
)
