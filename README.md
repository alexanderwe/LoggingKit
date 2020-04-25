# LoggingKit

<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat" alt="Swift 5.0">
   </a>
   <a href="https://github.com/Carthage/Carthage">
      <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage Compatible">
   </a>
   <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="SPM">
   </a>
</p>



<p align="center">
LoggingKit is a micro framework for logging in which uses `os_log` under the hood. 
</p>

## Features

- [x] Uses `os_log` under the hood
- [x] `Combine` ready

## Example

The example application is the best way to see `LoggingKit` in action. Simply open the `LoggingKit.xcodeproj` and run the `Example` scheme. 

After the application has started you should see several log messages in your Xcode terminal and the `Console.app` for the device you ran the app on.

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate LoggingKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "alexanderwe/LoggingKit"
```

Run `carthage update` to build the framework and drag the built `LoggingKit.framework` into your Xcode project. 

On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase” and add the Framework path as mentioned in [Carthage Getting started Step 4, 5 and 6](https://github.com/Carthage/Carthage/blob/master/README.md#if-youre-building-for-ios-tvos-or-watchos)

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/alexanderwe/LoggingKit.git", from: "1.0.0")
]
```

Alternatively navigate to your Xcode project, select `Swift Packages` and click the `+` icon to search for `LoggingKit`.

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate LoggingKit into your project manually. Simply drag the `Sources` Folder into your Xcode project.

## Usage


At first it makes sense to create an extensions on `LogCategories` to define your own categories. 

```swift
import LoggingKit

extension LogCategories {
    public var viewControllers: LogCategory { return .init("viewControllers") }
    public var networking: LogCategory { return .init("networking") }
    ...
}
```

After that Simply import `LoggingKit` in the files you want to use the logging methods and use them accordingly 

```swift
import LoggingKit 

logger.debug("Hello Debug", logCategory: \.viewControllers)
logger.info("Hello Info", logCategory: \.viewControllers)
logger.fault("Hello Fault", logCategory: \.viewControllers)
logger.error("Hello Error", logCategory: \.viewControllers)

```

### Combine 

If you are using combine `LoggingKit` offers some extensions on the `Publisher` type to log `Self.Output` and `Self.Failure`. 

```swift
import LoggingKit 

// logs `Self.Output`
myPublisher.logValue(logType: .info) {
    "My Value is \($0)"
}

// logs `Self.Failure`
myPublisher.logError(logCategory: \.combine) {
    "My Error is \($0)"
}

// logs `Self.Output` as well as `Self.Failure`
myPublisher.log()
```


### Console App

Now can open `Console.App` on your mac, select the device from which you want to view the log messages.


![Console App Screenshot][./assets/console_screenshot.png]

## Contributing
Contributions are very welcome 🙌

## License

```
LoggingKit
Copyright (c) 2020 LoggingKit

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
