import ProjectDescription

let bundlePrefix: String = "com.pichalski"
let deploymentTargetVersion: String = "16.0"

public enum uFeatureTarget {
    case framework
    case tests
    case testing
    case preview
}

extension Target {
    public static func makeFrameworkTargets(
        name: String,
        platform: Platform,
        targets: Set<uFeatureTarget> = Set([.framework, .tests, .preview, .testing]),
        dependencies: [TargetDependency] = [],
        testDependencies: [TargetDependency] = [],
        containsResources: Bool = false
    ) -> [Target] {
        var createdTargets: [Target] = []
        if targets.contains(.framework) {
            createdTargets.append(
                Target(
                    name: name,
                    platform: .iOS,
                    product: .framework,
                    bundleId: "\(bundlePrefix).\(name)",
                    deploymentTarget: .iOS(targetVersion: deploymentTargetVersion, devices: .iphone),
                    infoPlist: .default,
                    sources: ["Features/\(name)/Sources/**"],
                    resources: containsResources ? ["Features/\(name)/Resources/**"] : [],
                    dependencies: dependencies
                )
            )
        }
        if targets.contains(.testing) {
            createdTargets.append(
                Target(
                    name: "\(name)Testing",
                    platform: .iOS,
                    product: .framework,
                    bundleId: "\(bundlePrefix).\(name)Testing",
                    deploymentTarget: .iOS(targetVersion: deploymentTargetVersion, devices: .iphone),
                    infoPlist: .default,
                    sources: ["Features/\(name)/Testing/**/*.swift"],
                    resources: ["Features/\(name)/Testing/**/*"],
                    dependencies: dependencies.contains(.target(name: "Common")) ?
                    [.target(name: "\(name)"), .target(name: "Common")] :
                        [.target(name: "\(name)")]
                )
            )
        }
        if targets.contains(.tests) {
            createdTargets.append(
                Target(
                    name: "\(name)Tests",
                    platform: .iOS,
                    product: .unitTests,
                    bundleId: "\(bundlePrefix).\(name)Tests",
                    deploymentTarget: .iOS(targetVersion: deploymentTargetVersion, devices: .iphone),
                    infoPlist: .default,
                    sources: ["Features/\(name)/Tests/**/*.swift"],
                    dependencies: testDependencies + [.target(name: name)]
                )
            )
        }
        if targets.contains(.preview) {
            createdTargets.append(
                Target(
                    name: "\(name)Preview",
                    platform: .iOS,
                    product: .app,
                    bundleId: "\(bundlePrefix).\(name)Preview",
                    deploymentTarget: .iOS(targetVersion: deploymentTargetVersion, devices: .iphone),
                    infoPlist: .extendingDefault(with: ["UILaunchStoryboardName": "LaunchScreen"]),
                    sources: ["Features/\(name)/Preview/**/*.swift"],
                    dependencies: targets.contains(.testing) ?
                    [.target(name: "\(name)"), .target(name: "\(name)Testing")] :
                        [.target(name: "\(name)")]
                )
            )
        }
        return createdTargets
    }

    public static func makeAppTargets(
        name: String,
        platform: Platform,
        dependencies: [TargetDependency],
        containsTests: Bool
    ) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen",
            "UILaunchScreen": ["UIImageName": "SplashScreen", "UIImageRespectsSafeAreaInsets": false]
        ]
        var createdTargets: [Target] = []
        createdTargets.append(
            Target(
                name: name,
                platform: platform,
                product: .app,
                bundleId: "\(bundlePrefix).\(name)",
                infoPlist: .extendingDefault(with: infoPlist),
                sources: ["Features/\(name)/Sources/**"],
                resources: ["Features/\(name)/Resources/**"],
                dependencies: dependencies
            )
        )
        if containsTests {
            createdTargets.append(
                Target(
                    name: "\(name)Tests",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(bundlePrefix).\(name)Tests",
                    infoPlist: .default,
                    sources: ["Features/\(name)/Tests/**"],
                    dependencies: [
                        .target(name: "\(name)")
                    ]
                )
            )
        }
        return createdTargets
    }
}
