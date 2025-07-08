// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TuistFirebaseSample",
    platforms: [.iOS(.v15)],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: "11.6.0"),
    ]
)
