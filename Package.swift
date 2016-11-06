import PackageDescription

let package = Package(
    name: "Graphite",
    dependencies: [
        .Package(url: "https://github.com/ysnrkdm/Graphene", majorVersion: 1, minor: 9)
    ]
)
