//
//  SampleLogProvider.swift
//  LoggingDemo
//
//  Created by Alexander Weiß on 05.07.26.
//

import LoggingKit

struct SampleLogProvider: LogProvider {
    func log(
        _ event: LogType,
        _ message: @autoclosure () -> Any?,
        logCategory _: KeyPath<LogCategories, LogCategory>,
        fileName _: StaticString = #file,
        functionName _: StaticString = #function,
        lineNumber _: Int = #line
    ) {
        print("\(event) > \(message() ?? "")")
    }
}
