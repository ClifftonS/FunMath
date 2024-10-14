// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "FunMathWWDC",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "FunMathWWDC",
            targets: ["AppModule"],
            bundleIdentifier: "com.ada.FunMathWWDC",
            teamIdentifier: "G62A2BCNU5",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.pink),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait
            ],
            appCategory: .kidsGames
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
