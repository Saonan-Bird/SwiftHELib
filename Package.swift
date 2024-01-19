// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let rootPath = #file.dropLast("Package.swift".count)
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
                .unsafeFlags(["-L\(rootPath)/Sources/HELib/helib_pack/lib", "-Wl,-rpath,\(rootPath)/Sources/HELib/helib_pack/lib", "-lhelib", "-lgmp", "-lntl"])
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
