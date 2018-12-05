//
//  NSObject+BMDebugDescription.swift
//  BMDebugKit
//
//  Created by Benjamin Mies on 05.12.18.
//  Copyright © 2018 Benjamin Mies. All rights reserved.
//

import UIKit

extension NSObject {

    public func getDebugDescription() -> String {
        var result = ""
        for attribute in Mirror(reflecting: self).children {
            if let name = attribute.label, let value = attribute.value as? NSObject {
                result += name + ": " + value.debugDescription + "\n"
            }
        }
        return result
    }
}
