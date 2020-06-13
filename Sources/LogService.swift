//
//  File.swift
//  
//
//  Created by Alexander Weiß on 13.06.20.
//

import Foundation

public protocol LogProvider {
    
    /// Process the log message
    ///
    /// - Parameters:
    ///   - event: Log type
    ///   - message: Log message to process
    ///   - logCategory: The category of the log message
    ///   - fileName: File name where the log message is created
    ///   - functionName: Name of the function in which the log message is created
    ///   - lineNumber: Line number in the file in which the log message is created
    func log(
        _ event: LogType,
        _ message: @autoclosure () -> Any?,
        logCategory: KeyPath<LogCategories, LogCategory>,
        fileName: StaticString,
        functionName: StaticString,
        lineNumber: Int
    )
}

/// Log service
///
/// Responsible for distributing the log messages to the log providers
public final class LogService {
    
    private static var providers = [LogProvider]()
    
    /// Singleton instance of the log service
    public static let shared = LogService(providers: providers)
    
    private init(providers: [LogProvider]) {
        LogService.providers = providers
    }
    
    public static func register(logProviders: LogProvider...) {
        providers.append(contentsOf: logProviders)
    }
    
    public static func unregisterAll() {
        providers.removeAll()
    }
    
    internal func log(_ event: LogType,
                      _ message: @escaping @autoclosure () -> Any?,
                      logCategory: KeyPath<LogCategories, LogCategory> = \.default,
                      fileName: StaticString = #file,
                      functionName: StaticString = #function,
                      lineNumber: Int = #line
    ) {
        LogService.providers.forEach {
            $0.log(event,
                   message(),
                   logCategory: logCategory,
                   fileName: fileName,
                   functionName: functionName,
                   lineNumber: lineNumber
            )
        }
    }
    
    /// Create an info type log message
    ///
    /// - Parameters:
    ///   - message: Log message to process
    ///   - logCategory: The category of the log message
    ///   - fileName: File name where the log message is created
    ///   - functionName: Name of the function in which the log message is created
    ///   - lineNumber: Line number in the file in which the log message is created
    public func info(_ message: @escaping @autoclosure () -> Any?,
                     logCategory: KeyPath<LogCategories, LogCategory> = \.default,
                     fileName: StaticString = #file,
                     functionName: StaticString = #function,
                     lineNumber: Int = #line
    ) {
        LogService.providers.forEach {
            $0.log(.info,
                   message(),
                   logCategory: logCategory,
                   fileName: fileName,
                   functionName: functionName,
                   lineNumber: lineNumber
            )
        }
    }
    
    /// Create a debug type log message
    ///
    /// - Parameters:
    ///   - message: Log message to process
    ///   - logCategory: The category of the log message
    ///   - fileName: File name where the log message is created
    ///   - functionName: Name of the function in which the log message is created
    ///   - lineNumber: Line number in the file in which the log message is created
    public func debug(_ message: @escaping @autoclosure () -> Any?,
                      logCategory: KeyPath<LogCategories, LogCategory> = \.default,
                      fileName: StaticString = #file,
                      functionName: StaticString = #function,
                      lineNumber: Int = #line
    ) {
        LogService.providers.forEach {
            $0.log(.debug,
                   message(),
                   logCategory: logCategory,
                   fileName: fileName,
                   functionName: functionName,
                   lineNumber: lineNumber
            )
        }
    }
    
    /// Create a verbose type log message
    ///
    /// - Parameters:
    ///   - message: Log message to process
    ///   - logCategory: The category of the log message
    ///   - fileName: File name where the log message is created
    ///   - functionName: Name of the function in which the log message is created
    ///   - lineNumber: Line number in the file in which the log message is created
    public func verbose(_ message: @escaping @autoclosure () -> Any?,
                        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
                        fileName: StaticString = #file,
                        functionName: StaticString = #function,
                        lineNumber: Int = #line
    ) {
        LogService.providers.forEach {
            $0.log(.verbose,
                   message(),
                   logCategory: logCategory,
                   fileName: fileName,
                   functionName: functionName,
                   lineNumber: lineNumber
            )
        }
    }
    
    /// Create a warning type log message
    ///
    /// - Parameters:
    ///   - message: Log message to process
    ///   - logCategory: The category of the log message
    ///   - fileName: File name where the log message is created
    ///   - functionName: Name of the function in which the log message is created
    ///   - lineNumber: Line number in the file in which the log message is created
    public func warning(_ message: @escaping @autoclosure () -> Any?,
                        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
                        fileName: StaticString = #file,
                        functionName: StaticString = #function,
                        lineNumber: Int = #line
    ) {
        LogService.providers.forEach {
            $0.log(.warning,
                   message(),
                   logCategory: logCategory,
                   fileName: fileName,
                   functionName: functionName,
                   lineNumber: lineNumber
            )
        }
    }
    
    /// Create an error type log message
    ///
    /// - Parameters:
    ///   - message: Log message to process
    ///   - logCategory: The category of the log message
    ///   - fileName: File name where the log message is created
    ///   - functionName: Name of the function in which the log message is created
    ///   - lineNumber: Line number in the file in which the log message is created
    public func error(_ message: @escaping @autoclosure () -> Any?,
                      logCategory: KeyPath<LogCategories, LogCategory> = \.default,
                      fileName: StaticString = #file,
                      functionName: StaticString = #function,
                      lineNumber: Int = #line
    ) {
        LogService.providers.forEach {
            $0.log(.error,
                   message(),
                   logCategory: logCategory,
                   fileName: fileName,
                   functionName: functionName,
                   lineNumber: lineNumber
            )
        }
    }
}
