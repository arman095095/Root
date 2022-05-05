// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private var dependencies: [Package.Dependency] = [.package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")]

private let remoteDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/arman095095/Managers.git", branch: "develop"),
    .package(url: "https://github.com/arman095095/Module.git", branch: "develop"),
    .package(url: "https://github.com/arman095095/DesignSystem.git", branch: "develop"),
    .package(url: "https://github.com/arman095095/Settings.git", branch: "develop"),
    .package(url: "https://github.com/arman095095/Profile.git", branch: "develop"),
    .package(url: "https://github.com/arman095095/Authorization.git", branch: "develop"),
    .package(url: "https://github.com/arman095095/AuthorizedZone.git", branch: "develop"),
    .package(url: "https://github.com/arman095095/RootRouteMap.git", branch: "develop")
]

private let localDependencies: [Package.Dependency] = [
    .package(path: "../Managers"),
    .package(path: "../Module"),
    .package(path: "../DesignSystem"),
    .package(path: "../Settings"),
    .package(path: "../Profile"),
    .package(path: "../Authorization"),
    .package(path: "../AuthorizedZone"),
    .package(path: "../RootRouteMap")
]

private let isDev = true
isDev ? dependencies.append(contentsOf: localDependencies) : dependencies.append(contentsOf: remoteDependencies)

let package = Package(
    name: "Root",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Root",
            targets: ["Root"]),
    ],
    dependencies: dependencies,
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Root",
            dependencies: [.product(name: "Module", package: "Module"),
                           .product(name: "DesignSystem", package: "DesignSystem"),
                           .product(name: "Managers", package: "Managers"),
                           .product(name: "Swinject", package: "Swinject"),
                           .product(name: "Settings", package: "Settings"),
                           .product(name: "Profile", package: "Profile"),
                           .product(name: "Authorization", package: "Authorization"),
                           .product(name: "AuthorizedZone", package: "AuthorizedZone"),
                           .product(name: "RootRouteMap", package: "RootRouteMap")]),
    ]
)

