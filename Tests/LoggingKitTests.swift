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
        ("testProviderRegistration", testProviderRegistration),
    ]
    
    func testProviderRegistration() {
        LogService.register(provider: OSLogProvider())
        LogService.unregisterAll()
    }
}
