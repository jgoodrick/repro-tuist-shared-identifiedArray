import ProjectDescription

let project = Project(
    name: "SharedIdentifiedArrayBug",
    targets: [
        .target(
            name: "SharedIdentifiedArrayBug",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.SharedIdentifiedArrayBug",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["SharedIdentifiedArrayBug/Sources/**"],
            resources: ["SharedIdentifiedArrayBug/Resources/**"],
            dependencies: [
                .target(name: "SharedIdentifiedArrayBugFramework", condition: .none),
            ]
        ),
        .target(
            name: "SharedIdentifiedArrayBugFramework",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.SharedIdentifiedArrayBugFramework",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["SharedIdentifiedArrayBugFramework/Sources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture", condition: .none),
            ]
        ),
        .target(
            name: "SharedIdentifiedArrayBugTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.SharedIdentifiedArrayBugTests",
            infoPlist: .default,
            sources: ["SharedIdentifiedArrayBug/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "SharedIdentifiedArrayBug", condition: .none)
            ]
        ),
    ]
)
