import PackageDescription

let package = Package(
  name: "iOSBKMExpressFlowSDK",
  platforms: [
    .iOS(.v12)
  ],
  products: [
    .library(
      name: "BKMExpress",
      targets: ["BKMExpress"]
    )
  ],
  targets: [
    .binaryTarget(
      name: "BKMExpress",
      path: "BKMExpress.xcframework"
    )
  ]
)
