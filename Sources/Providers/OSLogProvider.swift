//
//  File.swift
//  
//
//  Created by Alexander Weiß on 13.06.20.
//

import Foundation
import os.log

// MARK: - OSLog Conversion
extension OSLogType {
    init(from: LogType) {
        switch from {
        case .debug:
            self = .debug
        case .verbose:
            self = .default
        case .info:
            self = .info
        case .warning:
            self = .error
        case .error:
            self = .fault
        }
    }
}

/// Simple log provider which uses Apple's Unified Logging System via `os_log`
///
/// - seeAlso:
///   - [Apple Logging Documentation](https://developer.apple.com/documentation/os/logging#1682416)
///   - [Based on https://github.com/mono0926/mono-kit/blob/master/Lib/Logger.swift](https://github.com/mono0926/mono-kit/blob/master/Lib/Logger.swift)
public struct OSLogProvider: LogProvider {
    
    public init() {}
    
    public func log(_ event: LogType,
                    _ message: @autoclosure () -> Any?,
                    logCategory: KeyPath<LogCategories, LogCategory>,
                    fileName: StaticString = #file,
                    functionName: StaticString = #function,
                    lineNumber: Int = #line
    ) {
        self.doLog(message(),
                   logType: event,
                   logCategory: logCategory,
                   functionName: functionName,
                   fileName: fileName,
                   lineNumber: lineNumber
        )
    }
}

// MARK: - Producing the log output
extension OSLogProvider {
    
    /// Acutally loggs the message using `os_log`
    ///
    /// - Parameters:
    ///   - message: Message to log
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    private func doLog( _ message: @autoclosure () -> Any?,
                        logType: LogType,
                        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
                        functionName: StaticString,
                        fileName: StaticString,
                        lineNumber: Int
    ) {
        let osLogType = OSLogType(from: logType)
        let staticSelf = type(of: self)
        let log = LoggingCategories[logCategory].logger
        guard log.isEnabled(type: osLogType) else {
            return
        }
        guard let output = staticSelf.buildOutput(message(),
                                                  logType: logType,
                                                  functionName: functionName,
                                                  fileName: fileName,
                                                  lineNumber: lineNumber) else { return }
        
        os_log("%@", log: log, type: osLogType, output)
    }
    
    /// Produces the log output
    ///
    /// - Parameters:
    ///   - message: Message to log
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    /// - Returns: A formatted log message
    internal static func buildOutput(_ message: @autoclosure () -> Any?,
                                     logType: LogType,
                                     functionName: StaticString,
                                     fileName: StaticString,
                                     lineNumber: Int) -> String? {
        guard let message = message() else {
            return nil
        }
        return "[\(logType)] [\(threadName)] [\((String(describing: fileName) as NSString).lastPathComponent):\(lineNumber)] \(functionName) > \(message)"
    }
    
    /// Extracts the current thread name
    private static var threadName: String {
        if Thread.isMainThread {
            return "main"
        }
        if let threadName = Thread.current.name, !threadName.isEmpty {
            return threadName
        }
        if let queueName = DispatchQueue.currentQueueLabel, !queueName.isEmpty {
            return queueName
        }
        return String(format: "[%p] ", Thread.current)
    }
    
}

extension DispatchQueue {
    public static var currentQueueLabel: String? {
        return String(validatingUTF8: __dispatch_queue_get_label(nil))
    }
}
// swiftlint:enable type_contents_order
