// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.30.0-beta2"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/bioche/RealmBinaries/releases/download/\(realmVersion)"
    
#if swift(>=5.7.1)
    let xcodeVersion = "14_1"
    let realmChecksum = "91663b8e0658a5d5af353d1c6fdc37f37d540d4ebbc0f36f947368809801a000"
    let realmSwiftChecksum = "d441071be1f716ceb8c1551bb18d6534e36bdc39cf122482bea607f2c84a578a"
#elseif swift(>=5.7.0)
    let xcodeVersion = "14_0"
    let realmChecksum = "e41b992812da0f22fe52d813fa235c21cc39e9d028b98b24fb234035f0a31b8e"
    let realmSwiftChecksum = "81fe3250331c10300a56c27803fe71c7545b982953a764ffa393160954948c20"
#else
    let xcodeVersion = "13_4_1"
    let realmChecksum = "b343d3bc78d0270ee5f615ab3ae6cdde1f835e216f38c68885dd78ddeb1e76e4"
    let realmSwiftChecksum = "77fc7f8c459240b3b777feb75cee0bec33db7e504d6f2caa69918a1bc2233a86"
#endif
    
    return [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm_\(xcodeVersion).xcframework.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift_\(xcodeVersion).xcframework.zip",
            checksum: realmSwiftChecksum
        )
    ]
}
// Binari compilati e caricati su github da "bioche", da rivedere questa cosa
let package = Package(
    name: "RealmBinaries",
    platforms: [.iOS("12.0")],
    products: [
        .library(
            name: "Realm",
            targets: ["Realm"]),
        .library(
            name: "RealmSwift",
            targets: ["RealmSwift"])
    ],
    targets: buildTargets()
)
