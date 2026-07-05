//
//  LoggingCategories.swift
//  LoggingDemo
//
//  Created by Alexander Weiß on 05.07.26.
//

import LoggingKit

extension LogCategories {
    var view: LogCategory {
        LogCategory("view")
    }

    var appLifecycle: LogCategory {
        LogCategory("app-lifecycle")
    }
}
