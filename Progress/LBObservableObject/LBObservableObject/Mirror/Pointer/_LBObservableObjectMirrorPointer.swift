//
//  _LBObservableObjectMirrorPointer.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import Foundation

class _LBObservableObjectMirrorPointer {
    /*
     * */
    internal static func with<T, R>(_ value: inout T,
                                    _ body: (UnsafeMutableRawPointer) throws -> R) throws -> R {
        guard Mirror.isClass(value) else {
            return try _struct(&value, body)
        }
        return try _class(&value, body)
    }
}

extension _LBObservableObjectMirrorPointer {
    // =============================================== //
    // MARK: -
    // =============================================== //
    fileprivate static func _struct<T, R>(_ value: inout T,
                                  _ body: (UnsafeMutableRawPointer) throws -> R) throws -> R {
        return try withUnsafePointer(to: &value) {
            let pointer = UnsafeMutableRawPointer(mutating: $0)
            return try body(pointer)
        }
    }
}


extension _LBObservableObjectMirrorPointer {
    // =============================================== //
    // MARK: -
    // =============================================== //
    fileprivate static func _class<T, R>(_ value: inout T,
                                  _ body: (UnsafeMutableRawPointer) throws -> R) throws -> R {
        return try withUnsafePointer(to: &value) {
            try $0.withMemoryRebound(to: UnsafeMutableRawPointer.self, capacity: 1) { try body($0.pointee) }
        }
    }
}

