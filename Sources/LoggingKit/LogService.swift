//
//  LogService.swift
//
//
//  Created by Alexander Weiß on 13.06.20.
//

import Foundation
import Synchronization

/// Log service
///
/// Responsible for distributing the log messages to the log providers
public final nonisolated class LogService: Sendable {
    private let providers: Mutex<[any LogProvider]>

    /// Singleton instance of the log service
    public static let shared = LogService(providers: [])

    private init(providers: [any LogProvider]) {
        self.providers = Mutex<[any LogProvider]>(providers)
    }

    public static func register(logProviders: any LogProvider...) {
        shared.providers.withLock {
            $0.append(contentsOf: logProviders)
        }
    }

    public static func unregisterAll() {
        shared.providers.withLock {
            $0.removeAll()
        }
    }

    func log(
        _ event: LogType,
        _ message: @escaping @autoclosure () -> Any?,
        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
        fileName: StaticString = #file,
        functionName: StaticString = #function,
        lineNumber: Int = #line
    ) {
        providers.withLock {
            $0.forEach { provider in
                provider.log(
                    event,
                    message(),
                    logCategory: logCategory,
                    fileName: fileName,
                    functionName: functionName,
                    lineNumber: lineNumber
                )
            }
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
    public static func info(
        _ message: @escaping @autoclosure () -> Any?,
        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
        fileName: StaticString = #file,
        functionName: StaticString = #function,
        lineNumber: Int = #line
    ) {
        shared.providers.withLock { providers in
            providers.forEach { provider in
                provider.log(
                    .info,
                    message(),
                    logCategory: logCategory,
                    fileName: fileName,
                    functionName: functionName,
                    lineNumber: lineNumber
                )
            }
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
    public static func debug(
        _ message: @escaping @autoclosure () -> Any?,
        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
        fileName: StaticString = #file,
        functionName: StaticString = #function,
        lineNumber: Int = #line
    ) {
        shared.providers.withLock { providers in
            providers.forEach { provider in
                provider.log(
                    .debug,
                    message(),
                    logCategory: logCategory,
                    fileName: fileName,
                    functionName: functionName,
                    lineNumber: lineNumber
                )
            }
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
    public static func verbose(
        _ message: @escaping @autoclosure () -> Any?,
        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
        fileName: StaticString = #file,
        functionName: StaticString = #function,
        lineNumber: Int = #line
    ) {
        shared.providers.withLock { providers in
            providers.forEach { provider in
                provider.log(
                    .verbose,
                    message(),
                    logCategory: logCategory,
                    fileName: fileName,
                    functionName: functionName,
                    lineNumber: lineNumber
                )
            }
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
    public static func warning(
        _ message: @escaping @autoclosure () -> Any?,
        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
        fileName: StaticString = #file,
        functionName: StaticString = #function,
        lineNumber: Int = #line
    ) {
        shared.providers.withLock { providers in
            providers.forEach { provider in
                provider.log(
                    .warning,
                    message(),
                    logCategory: logCategory,
                    fileName: fileName,
                    functionName: functionName,
                    lineNumber: lineNumber
                )
            }
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
    public static func error(
        _ message: @escaping @autoclosure () -> Any?,
        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
        fileName: StaticString = #file,
        functionName: StaticString = #function,
        lineNumber: Int = #line
    ) {
        shared.providers.withLock { providers in
            providers.forEach { provider in
                provider.log(
                    .error,
                    message(),
                    logCategory: logCategory,
                    fileName: fileName,
                    functionName: functionName,
                    lineNumber: lineNumber
                )
            }
        }
    }
}
