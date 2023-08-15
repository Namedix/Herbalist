import ProjectDescription
import ProjectDescriptionHelpers

var targets: [Target] {
    var targets: [Target] = []
    targets += Target.makeAppTargets(
        name: "App",
        platform: .iOS,
        dependencies: [.target(name: "Tabs")],
        containsTests: false
    )
    targets += Target.makeFrameworkTargets(name: "Tabs", platform: .iOS, dependencies: [.target(name: "Common"), .target(name: "Profile")])
    targets += Target.makeFrameworkTargets(name: "Common", platform: .iOS, targets: [.framework], containsResources: true)
    targets += Target.makeFrameworkTargets(name: "Profile", platform: .iOS, dependencies: [.target(name: "Common")])
    return targets
}
let project = Project(name: "Herbalist", targets: targets)
