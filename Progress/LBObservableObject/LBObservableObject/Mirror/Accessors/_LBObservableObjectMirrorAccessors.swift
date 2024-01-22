//
//  _LBObservableObjectMirrorAccessors.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import Foundation

protocol _LBObservableObjectMirrorAccessors {
    
}

extension _LBObservableObjectMirrorAccessors {
    // ============================================= //
    // MARK: -
    // ============================================= //
    static func set(value: Any?, in pointer: UnsafeMutableRawPointer, group: String? = nil) {
        guard let value = value else {
            return
        }
        if var pointee = pointer.assumingMemoryBound(to: self).pointee as? (any LBObservablePropertyDataSource) {
            pointee.value = value
        }
        else if let value   = value as? LBObservableObject,
                let pointee = pointer.assumingMemoryBound(to: self).pointee as? LBObservableObject {
            pointee.copy(from: value, group: group)
        }
        else if let value = value as? Self {
            pointer.assumingMemoryBound(to: self).pointee = value
        }
    }
}

