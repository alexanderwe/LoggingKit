//
//  LoggingKitTests.swift
//  LoggingKitTests
//
//  Created by Alexander Weiß on 25. Apr 2020.
//  Copyright © 2020 LoggingKit. All rights reserved.
//

import Testing
@testable import LoggingKit

@Suite("LogService Tests")
struct LoggingKitTests {
    @Test
    func providerRegistration() {
        LogService.register(logProviders: OSLogProvider())
        LogService.unregisterAll()
    }
}
