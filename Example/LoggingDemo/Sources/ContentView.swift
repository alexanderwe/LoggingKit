//
//  ContentView.swift
//  LoggingDemo
//
//  Created by Weiß, Alexander on 28.12.24.
//

import LoggingKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Log", systemImage: "envelope") {
            LogService.verbose("Verbose", logCategory: \.view)
            LogService.debug("Debug", logCategory: \.view)
            LogService.info("Info", logCategory: \.view)
            LogService.warning("Warning", logCategory: \.view)
            LogService.error("Error", logCategory: \.view)
        }
    }
}

#Preview {
    ContentView()
}
