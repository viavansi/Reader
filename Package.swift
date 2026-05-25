// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Reader",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "Reader",
            targets: ["Reader"]
        ),
    ],
    targets: [
        .target(
            name: "Reader",
            // path raíz para poder excluir DemoApp, xcodeproj, etc.
            path: ".",
            exclude: [
                "Build",
                "Classes",            // ReaderAppDelegate, ReaderDemoController — DemoApp
                "Reader.xcodeproj",
                "Reader.podspec",
                "Reader-Info.plist",
                "Reader-Prefix.pch",
                "main.m",
                "HISTORY.md",
                "LICENSE.md",
                "README.md",
                "Todo.txt",
                "Resources",          // PDF + lprojs (paridad con el podspec, que tampoco los incluye)
                // PNGs de la DemoApp, no usados por la lib
                "Graphics/AppIcon-057.png",
                "Graphics/AppIcon-072.png",
                "Graphics/AppIcon-076.png",
                "Graphics/AppIcon-114.png",
                "Graphics/AppIcon-120.png",
                "Graphics/AppIcon-144.png",
                "Graphics/AppIcon-152.png",
                "Graphics/AppIcon-180.png",
                "Graphics/Default-568h@2x.png",
                "Graphics/Default-667h@2x.png",
                "Graphics/Default-736h@3x.png",
            ],
            sources: ["Sources"],
            resources: [
                // El podspec original usa s.resources = 'Graphics/Reader-*.png'.
                // Aquí procesamos todo Graphics/ tras haber excluido los AppIcon/Default.
                .process("Graphics"),
            ],
            publicHeadersPath: "Sources",
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("ImageIO"),
                .linkedFramework("MessageUI"),
            ]
        ),
    ]
)
