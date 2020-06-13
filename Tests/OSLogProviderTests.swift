//
//  OSLogProviderTests.swift
//  LoggingKit-iOS
//
//  Created by Alexander Weiß on 13.06.20.
//  Copyright © 2020 Alexander Weiß. All rights reserved.
//

@testable import LoggingKit
import XCTest
import Combine

class OSLogProviderTests: XCTestCase {
    
    static var allTests = [
        ("testOSLogproviderMessageBuilding", testOSLogproviderMessageBuilding),
        ("testOsLogProvider", testOsLogProvider),
        ("testCombineLogging", testCombineLogging),
    ]
    
    private var sub: AnyCancellable? = nil
    
    func testOSLogproviderMessageBuilding() {
        XCTAssertEqual(
            
            OSLogProvider.buildOutput("Debug message", logType: .verbose, functionName: "testMethod()", fileName: "TestFile.swift", lineNumber: 42),
            "[📣(verbose)] [main] [TestFile.swift:42] testMethod() > Debug message"
        )
        
        XCTAssertEqual(
            OSLogProvider.buildOutput("Debug message", logType: .debug, functionName: "testMethod()", fileName: "TestFile.swift", lineNumber: 42),
            "[📝(debug)] [main] [TestFile.swift:42] testMethod() > Debug message"
        )
        
        XCTAssertEqual(
            OSLogProvider.buildOutput("Debug message", logType: .info, functionName: "testMethod()", fileName: "TestFile.swift", lineNumber: 42),
            "[ℹ️(info)] [main] [TestFile.swift:42] testMethod() > Debug message"
        )
        
        XCTAssertEqual(
            OSLogProvider.buildOutput("Debug message", logType: .warning, functionName: "testMethod()", fileName: "TestFile.swift", lineNumber: 42),
            "[⚠️(warning)] [main] [TestFile.swift:42] testMethod() > Debug message"
        )
        
        XCTAssertEqual(
            OSLogProvider.buildOutput("Debug message", logType: .error, functionName: "testMethod()", fileName: "TestFile.swift", lineNumber: 42),
            "[‼️(error)] [main] [TestFile.swift:42] testMethod() > Debug message"
        )
    }
    
    func testOsLogProvider() {
        let provider = OSLogProvider()
        provider.log(.debug, "Hello Debug", logCategory: \.default)
        provider.log(.info, "Hello Info", logCategory: \.default)
        provider.log(.warning, "Hello Warning", logCategory: \.default)
        provider.log(.error, "Hello Error", logCategory: \.default)
        provider.log(.verbose, "Hello Verbose", logCategory: \.default)
        
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
