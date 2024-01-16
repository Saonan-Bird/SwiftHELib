// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftHELib",
    products: [
        .library(
            name: "SwiftHELib",
            targets: ["ObjCHELib", "SwiftHELib"]
        ),
    ],
    targets: [
        .target(
            name: "ObjCHELib",
            path: "Sources/ObjC",
            cxxSettings: [
                .headerSearchPath("../HELib/helib_pack"),
                .headerSearchPath("../HELib/helib_pack/include"),
                .unsafeFlags(["--std=c++17"])
            ],
            linkerSettings: [
                .linkedLibrary("helib"),
                .unsafeFlags(["-L./Sources/HELib/helib_pack/lib", "-v"]),
            ]
        ),
        .target(
            name: "SwiftHELib",
            dependencies: ["ObjCHELib"],
            path: "Sources/SwiftHELib"
        ),
    ]
)
