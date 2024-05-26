// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
        .iOS(.v17),
        .tvOS(.v17)
    ],
    products: [
        .targetLibrary("Feature")
    ],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.54.0")
    ],
    targets: [
        .target(name: "Feature"),
        .testTarget(name: "FeatureTests")
    ]
)

extension Product {
    static func targetLibrary(_ name: String) -> Product {
        .library(name: name, targets: [name])
    }
}

// Inject base plugins into each target
package.targets = package.targets.map { target in
    var plugins = target.plugins ?? []
    plugins.append(.plugin(name: "SwiftLintBuildToolPlugin", package: "swiftlint"))
    target.plugins = plugins
    return target
}
