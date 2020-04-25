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
        ("testTraditional", testTraditional),
        ("testCombine", testCombine),
    ]
    
    private var sub: AnyCancellable? = nil
    
    func testTraditional() {
        
        // Traditional methods
        logger.debug("Hello Debug", logCategory: \.default)
        logger.info("Hello Info", logCategory: \.default)
        logger.fault("Hello Fault", logCategory: \.default)
        logger.error("Hello Error", logCategory: \.default)
        
    }
    
    func testCombine() {
        // Combine publishers
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
