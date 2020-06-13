//
//  File.swift
//  
//
//  Created by Alexander Weiß on 13.06.20.
//

import Foundation

public enum LogType: String {
    case info = "ℹ️(info)" // some information
     case debug = "📝(debug)" // something to debug
     case verbose = "📣(verbose)" // debugging on steroids
     case warning = "⚠️(warning)" // not good, but not fatal
     case error = "‼️(error)" // this is fatal
}

extension LogType: CustomStringConvertible {
    public var description: String {
        return self.rawValue
    }
}
