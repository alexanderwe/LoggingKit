//
//  LogCategory.swift
//  LoggingKit-iOS
//
//  Created by Alexander Weiß on 25.04.20.
//  Copyright © 2020 Alexander Weiß. All rights reserved.
//

@_exported import Foundation
@_exported import os.log

// MARK: - LogCategories

//swiftlint:disable identifier_name
// Default log categories container
public var LoggingCategories = LogCategories()
//swiftlint:enable identifier_name

/// Container for holding different log categories
public struct LogCategories {
    
    subscript(keyPath: KeyPath<LogCategories, LogCategory>) -> LogCategory {
          return self[keyPath: keyPath]
    }
}

// MARK: Default log categories
extension LogCategories {
    public var `default`: LogCategory { return .init("default") }
}

// MARK: - LogCategory

/// A representation of a log category
public struct LogCategory {
    //swiftlint:disable identifier_name
    public let _key: String
    //swiftlint:enable identifier_name
    
    var logger: OSLog {
        return OSLog(subsystem: Bundle.main.bundleIdentifier ?? "dev.teabyte.loggingkit", category: _key)
    }
    
    public init(_ key: String) {
        self._key = key
    }
}
