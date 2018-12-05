//
//  BMLogger.swift
//  BMDebugKit
//
//  Created by Benjamin Mies on 05.12.18.
//  Copyright © 2018 Benjamin Mies. All rights reserved.
//

import UIKit

class BMLogger {
    
    func verbose(fileName: String = #file, functionName: String = #function, line: Int = #line, _ message: String) {
        print(getDateString() + "##VERBOSE## " + formatMessage(fileName: fileName, functionName: functionName, line: line, message: message))
    }
    
    func debug(fileName: String = #file, functionName: String = #function, line: Int = #line, _ message: String) {
        print(getDateString() + "##DEBUG## " + formatMessage(fileName: fileName, functionName: functionName, line: line, message: message))
    }
    
    func info(fileName: String = #file, functionName: String = #function, line: Int = #line, _ message: String) {
        print(getDateString() + "##INFO## " + formatMessage(fileName: fileName, functionName: functionName, line: line, message: message))
    }
    
    func warning(fileName: String = #file, functionName: String = #function, line: Int = #line, _ message: String) {
        print(getDateString() + "##WARNING## " + formatMessage(fileName: fileName, functionName: functionName, line: line, message: message))
    }
    
    func error(fileName: String = #file, functionName: String = #function, line: Int = #line, _ message: String) {
        print(getDateString() + "##ERROR## " + formatMessage(fileName: fileName, functionName: functionName, line: line, message: message))
    }
    
    private func formatMessage(fileName: String, functionName: String, line: Int, message: String) -> String {
        let parts = fileName.components(separatedBy: "/")
        let className = parts.last ?? "Unnkown class"
        return String(format: "%@::%@::Line %i\n    -> %@", className, functionName, line, message)
    }
    
    private func getDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss "
        return formatter.string(from: Date())
    }
}


