//
//  LogProvider.swift
//  LoggingKit
//
//  Created by Alexander Weiß on 05.07.26.
//

public protocol LogProvider: Sendable {
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
