//
//  Logging+LogCategories.swift
//  Example
//
//  Created by Alexander Weiss on 25.04.20.
//  Copyright © 2020 LoggingKit. All rights reserved.
//

import LoggingKit

extension LogCategories {
    public var viewControllers: LogCategory { return .init("viewControllers") }
    public var combine: LogCategory { return .init("combine") }
}
