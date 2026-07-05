//
//  OSLogProviderTests.swift
//  LoggingKit-iOS
//
//  Created by Alexander Weiß on 13.06.20.
//  Copyright © 2020 Alexander Weiß. All rights reserved.
//

import Combine
import Testing
@testable import LoggingKit

/// Helper error
enum NumberError: Error {
    case numberTooHigh
}

@Suite("OSLogProvider Tests")
struct OSLogProviderTests {
    @Test
    func verboseMessageBuilding() {
        let message = OSLogProvider.buildOutput(
            "Debug message",
            logType: .verbose,
            functionName: "testMethod()",
            fileName: "TestFile.swift",
            lineNumber: 42
        )

        #expect(message ==
            "[📣(verbose)] [com.apple.root.user-initiated-qos.cooperative] [TestFile.swift:42] testMethod() > Debug message")
    }

    @Test
    func debugMessageBuilding() {
        let message = OSLogProvider.buildOutput(
            "Debug message",
            logType: .debug,
            functionName: "testMethod()",
            fileName: "TestFile.swift",
            lineNumber: 42
        )

        #expect(message ==
            "[📝(debug)] [com.apple.root.user-initiated-qos.cooperative] [TestFile.swift:42] testMethod() > Debug message")
    }

    @Test
    func infoMessageBuilding() {
        let message = OSLogProvider.buildOutput(
            "Debug message",
            logType: .info,
            functionName: "testMethod()",
            fileName: "TestFile.swift",
            lineNumber: 42
        )

        #expect(message ==
            "[ℹ️(info)] [com.apple.root.user-initiated-qos.cooperative] [TestFile.swift:42] testMethod() > Debug message")
    }

    @Test
    func warningMessageBuilding() {
        let message = OSLogProvider.buildOutput(
            "Debug message",
            logType: .warning,
            functionName: "testMethod()",
            fileName: "TestFile.swift",
            lineNumber: 42
        )

        #expect(message ==
            "[⚠️(warning)] [com.apple.root.user-initiated-qos.cooperative] [TestFile.swift:42] testMethod() > Debug message")
    }

    @Test
    func errorMessageBuilding() {
        let message = OSLogProvider.buildOutput(
            "Debug message",
            logType: .error,
            functionName: "testMethod()",
            fileName: "TestFile.swift",
            lineNumber: 42
        )

        #expect(message ==
            "[‼️(error)] [com.apple.root.user-initiated-qos.cooperative] [TestFile.swift:42] testMethod() > Debug message")
    }

    @Test
    func logging() {
        let provider = OSLogProvider()
        provider.log(.debug, "Hello Debug", logCategory: \.default)
        provider.log(.info, "Hello Info", logCategory: \.default)
        provider.log(.warning, "Hello Warning", logCategory: \.default)
        provider.log(.error, "Hello Error", logCategory: \.default)
        provider.log(.verbose, "Hello Verbose", logCategory: \.default)
    }

    func testOsLogProvider() {
        let provider = OSLogProvider()
        provider.log(.debug, "Hello Debug", logCategory: \.default)
        provider.log(.info, "Hello Info", logCategory: \.default)
        provider.log(.warning, "Hello Warning", logCategory: \.default)
        provider.log(.error, "Hello Error", logCategory: \.default)
        provider.log(.verbose, "Hello Verbose", logCategory: \.default)
    }

    @Test
    func combine() async {
        var cancellable: Set<AnyCancellable> = []

        await confirmation { confirmation in
            Result<Int, NumberError>.Publisher(5)
                .logValue(logType: .info, logCategory: \.combine) {
                    "My Value is \($0)"
                }
                .tryMap { (_: Int) in
                    throw NumberError.numberTooHigh
                }
                .logError(logCategory: \.combine) {
                    "My error is \($0)"
                }
                .sink(receiveCompletion: {
                    _ in confirmation.confirm()
                }, receiveValue: { _ in })
                .store(in: &cancellable)
        }
    }
}

// MARK: - Helpers
extension LogCategories {
    var combine: LogCategory {
        return LogCategory("combine")
    }
}
