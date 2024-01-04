// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Shared", targets: ["Shared"]),
        .library(name: "FeatureA", targets: ["FeatureA"]),
        .library(name: "FeatureB", targets: ["FeatureB"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Shared", dependencies: []),
        .target(name: "FeatureA", dependencies: ["Shared"]),
        .target(name: "FeatureB", dependencies: ["Shared"]),
    ]
)
