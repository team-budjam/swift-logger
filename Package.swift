// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-logger",
    platforms: [.iOS(.v26), .macOS(.v26)],
    products: [
        .library(
            name: "SwiftLogger",
            targets: ["SwiftLogger"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftLogger"
        ),
        .testTarget(
            name: "SwiftLoggerTests",
            dependencies: ["SwiftLogger"]
        )
    ]
)
