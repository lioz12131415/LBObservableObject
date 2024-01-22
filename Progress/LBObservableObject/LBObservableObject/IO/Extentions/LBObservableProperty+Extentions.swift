//
//  LBObservableProperty+Extentions.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

extension LBObservableProperty {
    // ====================================================== //
    // MARK: -
    // ====================================================== //
    internal func convert<T: LBObservablePropertyValueType>(to type: T.Type) -> LBObservableProperty<T>? {
        return LBObservableProperty<T>.convert(self)
    }
}

extension LBObservableProperty {
    // ====================================================== //
    // MARK: -
    // ====================================================== //
    internal static func convert(_ value: LBObservableObjectPropertyDynamic) -> LBObservableProperty<Value>? {
        var property: LBObservableProperty<Value>?
        withUnsafePointer(to: &property) { pointer in
            UnsafeMutableRawPointer(mutating: pointer)
                .assumingMemoryBound(to: LBObservableObjectPropertyDynamic?.self).pointee = value
        }
        return property
    }
}
