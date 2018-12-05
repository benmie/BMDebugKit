//
//  UIViewController+BMLogging.swift
//  BMDebugKit
//
//  Created by Benjamin Mies on 05.12.18.
//  Copyright © 2018 Benjamin Mies. All rights reserved.
//

import UIKit

private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    guard
        let originalMethod = class_getInstanceMethod(forClass, originalSelector),
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
        else { return }
    method_exchangeImplementations(originalMethod, swizzledMethod)
}

extension UIViewController {
    
    static let debugInit: Void = {
        let originalSelector = #selector(viewDidAppear(_:))
        let swizzledSelector = #selector(swizzled_viewDidAppear(animated:))
        swizzling(UIViewController.self, originalSelector, swizzledSelector)
    }()
    
    @objc func swizzled_viewDidAppear(animated: Bool) {
        self.swizzled_viewDidAppear(animated: animated)
        if self is UINavigationController ||
            self is UITabBarController {
            return
        }
        let viewControllerName = NSStringFromClass(type(of: self))
        BMLogger.debug("Showing ViewController: \(viewControllerName)")
    }
}
