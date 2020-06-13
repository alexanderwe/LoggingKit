//
//  AppDelegate.swift
//  Example
//
//  Created by Alexander Weiß on 25. Apr 2020.
//  Copyright © 2020 LoggingKit. All rights reserved.
//

import UIKit
import LoggingKit

// MARK: - AppDelegate

/// The AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// The UIWindow
    var window: UIWindow?

    /// The RootViewController
    var rootViewController: UIViewController {
        return ViewController()
    }

    /// Application did finish launching with options
    ///
    /// - Parameters:
    ///   - application: The UIApplication
    ///   - launchOptions: The LaunchOptions
    /// - Returns: The launch result
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        LogService.register(logProviders: MyTestLogProvider())
        
        
        // Initialize UIWindow
        self.window = .init(frame: UIScreen.main.bounds)
        // Set RootViewController
        self.window?.rootViewController = self.rootViewController
        // Make Key and Visible
        self.window?.makeKeyAndVisible()
    
        // Return positive launch
        return true
    }

}
