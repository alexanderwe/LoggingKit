//
//  LoggingDemoApp.swift
//  LoggingDemo
//
//  Created by Weiß, Alexander on 28.12.24.
//

import LoggingKit
import SwiftUI

#if canImport(AppKit)
    import AppKit
#endif

@main
struct LoggingDemoApp: App {
    // MARK: - State Properties
    #if os(macOS)
        @NSApplicationDelegateAdaptor private var appDelegate: ApplicationDelegate
    #endif

    #if os(iOS) || os(visionOS)
        @UIApplicationDelegateAdaptor private var appDelegate: ApplicationDelegate
    #endif

    #if os(watchOS)
        @WKApplicationDelegateAdaptor private var appDelegate: ApplicationDelegate
    #endif

    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

#if os(macOS)
    class ApplicationDelegate: NSObject, NSApplicationDelegate, ObservableObject {
        func applicationDidFinishLaunching(_: Notification) {
            LogService.register(logProviders: OSLogProvider(), SampleLogProvider())

            LogService.info("Application did finish launching", logCategory: \.appLifecycle)
        }
    }
#endif

#if os(watchOS)
    class ApplicationDelegate: NSObject, WKApplicationDelegate, ObservableObject {
        func applicationDidFinishLaunching(_: Notification) {
            LogService.register(logProviders: OSLogProvider(), SampleLogProvider())

            LogService.info("Application did finish launching", logCategory: \.appLifecycle)
        }
    }
#endif

#if os(iOS) || os(visionOS)
    class ApplicationDelegate: NSObject, UIApplicationDelegate, ObservableObject {
        func applicationDidFinishLaunching(_: Notification) {
            LogService.register(logProviders: OSLogProvider(), SampleLogProvider())

            LogService.info("Application did finish launching", logCategory: \.appLifecycle)
        }
    }
#endif
