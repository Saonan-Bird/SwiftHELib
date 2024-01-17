// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftHELib",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftHELib",
            targets: ["ObjCHELib", "SwiftHELib"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ObjCHELib",
            path: "Sources/ObjC",
            cxxSettings: [
                .headerSearchPath("../HELib/helib_pack"),
                .headerSearchPath("../HELib/helib_pack/include"),
                .unsafeFlags(["--std=c++17"])
            ],
            linkerSettings: [
                .unsafeFlags(["-LSources/HELib/helib_pack/lib -lgmp -lhelib -lntl"])
            ]
        ),
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftHELib",
            dependencies: ["ObjCHELib"],
            path: "Sources/SwiftHELib"
        ),
    ]
)
