//
//  ViewController.swift
//  Example
//
//  Created by Alexander Weiß on 25. Apr 2020.
//  Copyright © 2020 LoggingKit. All rights reserved.
//

import UIKit
import Combine
import LoggingKit

// Helper error
enum NumberError: Error {
    case numberTooHigh
}

// MARK: - ViewController

/// The ViewController
class ViewController: UIViewController {
    
    // MARK: Properties
    private var sub: AnyCancellable? = nil
    
    /// The Label
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "🚀\nLoggingKit\nExample"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: View-Lifecycle
    
    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Traditional methods
        logger.debug("Hello Debug", logCategory: \.viewControllers)
        logger.info("Hello Info", logCategory: \.viewControllers)
        logger.fault("Hello Fault", logCategory: \.viewControllers)
        logger.error("Hello Error", logCategory: \.viewControllers)
        
        // Combine publishers
        sub = Result<Int, NumberError>.Publisher(5)
            .logValue(logType: .info, logCategory: \.combine) {
                "My Value is \($0)"
            }
            .tryMap { (number:Int)  in
                    throw NumberError.numberTooHigh
            }
            .logError(logCategory: \.combine) {
                "My Error is \($0)"
            }
            .sink(receiveCompletion: { _ in }, receiveValue: {_ in})
    }
    
    /// LoadView
    override func loadView() {
        self.view = self.label
    }
    
}
