# Getting Started

Learn how to integrate LoggingKit into your project.

## Adding LoggingKit as a dependency

```swift
let package = Package(
    dependencies: [
        .package(
            url: "https://github.com/alexanderwe/LoggingKit",
            from: "3.0.0"
        ),
    ],
    targets: [
        .target(
            name: "<target-name>",
            dependencies: [
                .product(
                    name: "LoggingKit",
                    package: "LoggingKit"
                )
            ]
        )
    ]
)
```

## Define log categories

Extend ``LogCategories`` to declare the log categories for your app:

```swift
import LoggingKit

extension LogCategories {
    var networking: LogCategory { LogCategory("networking") }
    var ui: LogCategory { LogCategory("ui") }
}
```

## Register a log provider

Register one or more ``LogProvider`` instances at app startup. LoggingKit ships with ``OSLogProvider`` out of the box:

```swift
import LoggingKit

@main
struct MyApp: App {
    init() {
        LogService.register(logProviders: OSLogProvider())
    }
}
```

## Log messages

Use ``LogService`` to emit categorized log messages:

```swift
LogService.info("App launched", logCategory: \.default)
LogService.debug("Fetching data", logCategory: \.networking)
LogService.error("Request failed", logCategory: \.networking)
```

## Implement a custom log provider

Conform to ``LogProvider`` to route logs to any backend (e.g. Crashlytics, a remote logging service):

```swift
import LoggingKit

struct MyCustomProvider: LogProvider {
    func log(
        _ event: LogType,
        _ message: @autoclosure () -> Any?,
        logCategory: KeyPath<LogCategories, LogCategory>,
        fileName: StaticString,
        functionName: StaticString,
        lineNumber: Int
    ) {
        guard let value = message() else { return }
        // Forward to your backend
        print("[\(event)] \(value)")
    }
}
```
