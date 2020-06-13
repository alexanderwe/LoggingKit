//
//  MyTestLogProvider.swift
//  Example
//
//  Created by Alexander Weiß on 13.06.20.
//  Copyright © 2020 Alexander Weiß. All rights reserved.
//

import Foundation
import LoggingKit

class MyTestLogProvider: LogProvider {
    
    static var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ssSSS"
        df.locale = Locale.current
        df.timeZone = TimeZone.current
        return df
    }()
    
    
    func log(_ event: LogType, _ message: @autoclosure () -> Any?, logCategory: KeyPath<LogCategories, LogCategory>, fileName: StaticString, functionName: StaticString, lineNumber: Int) {
        
        guard let message = message() else {
            return
        }
        
        let category = LoggingCategories[logCategory]
        let timeString = MyTestLogProvider.dateFormatter.string(from: Date())
        let fileString = "[\((String(describing: fileName) as NSString).lastPathComponent):\(lineNumber)] \(functionName) > \(message)"
        
        print("\(timeString) [\(event.rawValue)] - [\(category._key)] - \(fileString)")
        
    }
}
