//
//  File.swift
//  
//
//  Created by Alexander Weiß on 13.06.20.
//

import Foundation

/// Different log types
///
/// * info: Some informative message
/// * debug: Debugging purpose message
/// * verbose: Debugging message with a lot more information
/// * "warning": Warning, but not fatal message
/// * error: Fatal message
public enum LogType: String {
    case info = "ℹ️(info)"
     case debug = "📝(debug)"
     case verbose = "📣(verbose)"
     case warning = "⚠️(warning)"
     case error = "‼️(error)"
}

extension LogType: CustomStringConvertible {
    public var description: String {
        return self.rawValue
    }
}
