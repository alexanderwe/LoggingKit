//
//  LoggingKitTests.swift
//  LoggingKitTests
//
//  Created by Alexander Weiß on 25. Apr 2020.
//  Copyright © 2020 LoggingKit. All rights reserved.
//

@testable import LoggingKit
import XCTest


extension LogCategories {
    public var combine: LogCategory { return .init("combine") }
}

// Helper error
enum NumberError: Error {
    case numberTooHigh
}

class LoggingKitTests: XCTestCase {
    
    static var allTests = [
        ("testLogMessageBuilding", testLogMessageBuilding),
        ("testTraditionalLogging", testTraditionalLogging),
        ("testCombineLogging", testCombineLogging),
    ]
    
    private var sub: AnyCancellable? = nil
    
    func testLogMessageBuilding() {
        XCTAssertEqual(
            Logger.buildOutput("Debug message", logType: .default, functionName: "testMethod()", fileName: "TestFile.swift", lineNumber: 42),
            "[DEFAULT] [main] [TestFile.swift:42] testMethod() > Debug message"
        )
        
        
        XCTAssertEqual(
            Logger.buildOutput("Debug message", logType: .debug, functionName: "testMethod()", fileName: "TestFile.swift", lineNumber: 42),
            "[🔹(debug)] [main] [TestFile.swift:42] testMethod() > Debug message"
        )
        
        XCTAssertEqual(
            Logger.buildOutput("Debug message", logType: .info, functionName: "testMethod()", fileName: "TestFile.swift", lineNumber: 42),
            "[ℹ️(info)] [main] [TestFile.swift:42] testMethod() > Debug message"
        )
        
        XCTAssertEqual(
            Logger.buildOutput("Debug message", logType: .error, functionName: "testMethod()", fileName: "TestFile.swift", lineNumber: 42),
            "[‼️(error)] [main] [TestFile.swift:42] testMethod() > Debug message"
        )
        
        XCTAssertEqual(
            Logger.buildOutput("Debug message", logType: .fault, functionName: "testMethod()", fileName: "TestFile.swift", lineNumber: 42),
            "[💣(fault)] [main] [TestFile.swift:42] testMethod() > Debug message"
        )
    }
    
    func testTraditionalLogging() {
        logger.debug("Hello Debug", logCategory: \.default)
        logger.info("Hello Info", logCategory: \.default)
        logger.fault("Hello Fault", logCategory: \.default)
        logger.error("Hello Error", logCategory: \.default)
    }
    
    func testCombineLogging() {
        sub = Result<Int, NumberError>.Publisher(5)
            .logValue(logType: .info, logCategory: \.combine) {
                "My Value is \($0)"
        }
        .tryMap { (number:Int)  in
            throw NumberError.numberTooHigh
        }
        .logError(logCategory: \.combine) {
            "My error is \($0)"
        }
        .sink(receiveCompletion: { _ in }, receiveValue: {_ in})
    }
}
