import XCTest
@testable import LoggingKitTests

XCTMain([
    testCase(LoggingKitTests.allTests),
    testCase(OSLogProviderTests.allTests),
])
