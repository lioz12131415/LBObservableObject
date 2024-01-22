//
//  ValueType.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import Foundation

public protocol LBObservablePropertyValueType: Equatable {
        
}

@available(iOS 16.0, *)
extension UIContextMenuConfiguration.ElementOrder: LBObservablePropertyValueType { }

extension UIFont:                    LBObservablePropertyValueType { }
extension UIColor:                   LBObservablePropertyValueType { }
extension UIImage:                   LBObservablePropertyValueType { }
extension UIButton.Role:             LBObservablePropertyValueType { }
extension NSTextAlignment:           LBObservablePropertyValueType { }
extension UIBaselineAdjustment:      LBObservablePropertyValueType { }
extension UIView.TintAdjustmentMode: LBObservablePropertyValueType { }

extension Int:   LBObservablePropertyValueType { }
extension Int8:  LBObservablePropertyValueType { }
extension Int16: LBObservablePropertyValueType { }
extension Int32: LBObservablePropertyValueType { }

extension UInt:   LBObservablePropertyValueType { }
extension Int64:  LBObservablePropertyValueType { }
extension UInt8:  LBObservablePropertyValueType { }
extension UInt16: LBObservablePropertyValueType { }
extension UInt32: LBObservablePropertyValueType { }
extension UInt64: LBObservablePropertyValueType { }

extension Bool:     LBObservablePropertyValueType { }
extension Float:    LBObservablePropertyValueType { }
extension Double:   LBObservablePropertyValueType { }
extension String:   LBObservablePropertyValueType { }
extension CGFloat:  LBObservablePropertyValueType { }

extension Array:    LBObservablePropertyValueType where Element: LBObservablePropertyValueType { }
extension Optional: LBObservablePropertyValueType where Wrapped: LBObservablePropertyValueType { }

extension LBObservablePropertyValueType {
    // ===================================================== //
    // MARK: -
    // ===================================================== //
    internal var stringValue: String {
        if let v = self as? Int     { return "\(v)" }
        if let v = self as? Bool    { return "\(v)" }
        if let v = self as? Float   { return "\(v)" }
        if let v = self as? Double  { return "\(v)" }
        if let v = self as? String  { return "\(v)" }
        if let v = self as? CGFloat { return "\(v)" }
        return ""
    }
}
