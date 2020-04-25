//
//  Combine+LoggingKit.swift
//  Example
//
//  Created by Alexander Weiss on 25.04.20.
//  Copyright © 2020 LoggingKit. All rights reserved.
//

#if canImport(Combine)
@_exported import Combine
@_exported import os.log

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Publisher {
    
    /// Publisher which logs the failure value of the preceding publisher
    ///
    /// - Parameters:
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    ///   - message: Message to log
    /// - Returns: Returns an AnyPublisher with `AnyPublisher<Self.Output, Self.Failure>`
    public func logError(
        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
        functionName: StaticString = #function,
        fileName: StaticString = #file,
        lineNumber: Int = #line,
        _ message: @escaping (Self.Failure) -> Any? = { (output: Self.Failure) in return output }
    ) -> AnyPublisher<Self.Output, Self.Failure> {
        
        return self
            .mapError {
                logger.doLog(message($0),
                             logType: .error,
                             logCategory: logCategory,
                             functionName: functionName,
                             fileName: fileName,
                             lineNumber: lineNumber
                )
                return $0
            }
            .eraseToAnyPublisher()
    }
    
    /// Publisher which logs the ouput value of the preceding publisher
    ///
    /// - Parameters:
    ///   - logType: Type of the value log message
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    ///   - message: Message to log
    /// - Returns: Returns an AnyPublisher with `AnyPublisher<Self.Output, Self.Failure>`
    public func logValue(logType: OSLogType = .default,
                         logCategory: KeyPath<LogCategories, LogCategory> = \.default,
                         functionName: StaticString = #function,
                         fileName: StaticString = #file,
                         lineNumber: Int = #line,
                         _ message: @escaping (Self.Output) -> Any? = { (output: Self.Output) in return output }
    ) -> AnyPublisher<Self.Output, Self.Failure> {
        
        return self
            .map {
                logger.doLog(message($0),
                             logType: logType,
                             logCategory: logCategory,
                             functionName: functionName,
                             fileName: fileName,
                             lineNumber: lineNumber
                )
                return $0
            }
            .eraseToAnyPublisher()
    }
    
    /// Publisher which both logs the Self.Failure value and the Self.Output value of the preceding publisher
    /// - Parameters:
    ///   - messageValue: Self.Output message to log
    ///   - messageError: Self.Failure message to log
    ///   - valuelogType: Type of the Self.Output log message
    ///   - logCategory: Category of the both log messages
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    /// - Returns: Returns an AnyPublisher with `AnyPublisher<Self.Output, Self.Failure>`
    public func log(
        messageValue: @escaping (Self.Output) -> Any? = { (output: Self.Output) in return output },
        messageError: @escaping (Self.Failure) -> Any? = { (output: Self.Failure) in return output },
        valuelogType: OSLogType = .default,
        logCategory: KeyPath<LogCategories, LogCategory> = \.default,
        functionName: StaticString = #function,
        fileName: StaticString = #file,
        lineNumber: Int = #line)
        -> AnyPublisher<Self.Output, Self.Failure> {
            
            return self
                .logValue(logType: valuelogType,
                          logCategory: logCategory,
                          functionName: functionName,
                          fileName: fileName,
                          lineNumber: lineNumber,
                          messageValue
                )
                .logError(logCategory: logCategory,
                          functionName: functionName,
                          fileName: fileName,
                          lineNumber: lineNumber,
                          messageError
                )
                .eraseToAnyPublisher()
    }
}
#endif
