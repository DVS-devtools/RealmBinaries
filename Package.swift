// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Binari compilati e caricati su github da "bioche", da rivedere questa cosa
let package = Package(
    name: "RealmBinaries",
    platforms: [.iOS("12.0")],
    products: [
        .library(
            name: "Realm",
            targets: ["Realm"]
        ),
        .library(
            name: "RealmSwift",
            targets: ["RealmSwift"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "Realm",
            path: "Realm.xcframework"
        ),
        .binaryTarget(
            name: "RealmSwift",
            path: "RealmSwift.xcframework"
        )
    ]
)
