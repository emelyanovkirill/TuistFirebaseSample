import ProjectDescription

let project = Project(
    name: "TuistFirebaseSample",
    packages: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "11.6.0")
    ],
    targets: [
        .target(
            name: "ExternalDependencies",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.ExternalDependencies",
            sources: ["Features/ExternalDependencies/Sources/**"],
            dependencies: [
                .external(name: "FirebasePerformance"),
            ]
        ),
        .target(
            name: "PackageDependencies",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.PackageDependencies",
            sources: ["Features/PackageDependencies/Sources/**"],
            dependencies: [
                .package(product: "FirebasePerformance"),
            ]
        ),
        .target( // linker error ❌
            name: "FeatureWithPackageDependency",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.FeatureWithPackageDependency",
            sources: ["Features/FeatureWithProductDependency/Sources/**"],
            dependencies: [
                .target(name: "PackageDependencies")
            ]
        ),
        .target( // successful ✅
            name: "FeatureWithExternalDependency",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.FeatureWithExternalDependency",
            sources: ["Features/FeatureWithExternalDependency/Sources/**"],
            dependencies: [
                .target(name: "ExternalDependencies")
            ]
        ),
    ]
)
