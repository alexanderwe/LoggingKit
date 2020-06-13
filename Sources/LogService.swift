//
//  File.swift
//  
//
//  Created by Alexander Weiß on 13.06.20.
//

import Foundation

public protocol LogProvider {
    func log(
        _ event: LogType,
        _ message: @autoclosure () -> Any?,
        logCategory: KeyPath<LogCategories, LogCategory>,
        fileName: StaticString,
        functionName: StaticString,
        lineNumber: Int
    )
}

public final class LogService {
    
    private static var providers = [LogProvider]()
    
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
