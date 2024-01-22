//
//  Mirror+Extentions.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import Foundation

extension Mirror {
    // ======================================== //
    // MARK: -
    // ======================================== //
    internal static func isClass(_ objc: Any) -> Bool {
        guard let displayStyle = Mirror(reflecting: objc).displayStyle else {
            return false
        }
        return displayStyle == .class
    }
}

extension Mirror {
    // ======================================== //
    // MARK: -
    // ======================================== //
    internal static func isStruct(_ objc: Any) -> Bool {
        guard let displayStyle = Mirror(reflecting: objc).displayStyle else {
            return false
        }
        return displayStyle == .struct
    }
}
