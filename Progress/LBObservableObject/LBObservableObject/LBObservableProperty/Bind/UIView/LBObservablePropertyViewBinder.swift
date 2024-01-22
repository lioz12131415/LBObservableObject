//
//  LBObservablePropertyViewBinder.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 22/01/2024.
//

import UIKit
import Foundation

open class LBObservablePropertyViewBinder<View: UIView>: NSObject {
    
    public private(set) weak var view:                     View? = nil
    public private(set) /**/ var alpha:                    LBPropertyBindCGFloat?            = nil
    public private(set) /**/ var isOpaque:                 LBPropertyBindBool?               = nil
    public private(set) /**/ var isHidden:                 LBPropertyBindBool?               = nil
    public private(set) /**/ var tintColor:                LBPropertyBindColor?              = nil
    public private(set) /**/ var clipsToBounds:            LBPropertyBindBool?               = nil
    public private(set) /**/ var backgroundColor:          LBPropertyBindColor?              = nil
    public private(set) /**/ var tintAdjustmentMode:       LBPropertyBindTintAdjustmentMode? = nil
    public private(set) /**/ var isUserInteractionEnabled: LBPropertyBindBool?               = nil
        
    internal override init() {
        super.init()
    }
    
    public required init(_ view: View? = nil) {
        super.init()
        self.view = view
    }
    
    /*
     * */
    @discardableResult public func alpha<T: LBAnyCGFloat>(_ property: LBObservableProperty<T>) -> LBPropertyBindCGFloat {
        guard let property = property.convert(to: CGFloat.self) else {
            return .empty
        }
        if let alpha = alpha, alpha.contains(property) {
            return alpha
        }
        return LBPropertyBindCGFloat(property, &alpha) { [weak self] in
            self?.view?.alpha = $0
        }
    }
    /*
     * */
    @discardableResult public func isOpaque<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
        guard let property = property.convert(to: Bool.self) else {
            return .empty
        }
        if let isOpaque = isOpaque, isOpaque.contains(property) {
            return isOpaque
        }
        return LBPropertyBindBool(property, &isOpaque) { [weak self] in
            self?.view?.isOpaque = $0
        }
    }
    /*
     * */
    @discardableResult public func isHidden<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
        guard let property = property.convert(to: Bool.self) else {
            return .empty
        }
        if let isHidden = isHidden, isHidden.contains(property) {
            return isHidden
        }
        return LBPropertyBindBool(property, &isHidden) { [weak self] in
            self?.view?.isHidden = $0
        }
    }
    /*
     * */
    @discardableResult public func tintColor<T: LBAnyColor>(_ property: LBObservableProperty<T>) -> LBPropertyBindColor {
        guard let property = property.convert(to: UIColor.self) else {
            return .empty
        }
        if let tintColor = tintColor, tintColor.contains(property) {
            return tintColor
        }
        return LBPropertyBindColor(property, &tintColor) { [weak self] in
            self?.view?.tintColor = $0
        }
    }
    /*
     * */
    @discardableResult public func clipsToBounds<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
        guard let property = property.convert(to: Bool.self) else {
            return .empty
        }
        if let clipsToBounds = clipsToBounds, clipsToBounds.contains(property) {
            return clipsToBounds
        }
        return LBPropertyBindBool(property, &clipsToBounds) { [weak self] in
            self?.view?.clipsToBounds = $0
        }
    }
    /*
     * */
    @discardableResult public func backgroundColor<T: LBAnyColor>(_ property: LBObservableProperty<T>) -> LBPropertyBindColor {
        guard let property = property.convert(to: UIColor.self) else {
            return .empty
        }
        if let backgroundColor = backgroundColor, backgroundColor.contains(property) {
            return backgroundColor
        }
        return LBPropertyBindColor(property, &backgroundColor) { [weak self] in
            self?.view?.backgroundColor = $0
        }
    }
    /*
     * */
    @discardableResult public func tintAdjustmentMode<T: LBAnyTintAdjustmentMode>(_ property: LBObservableProperty<T>) -> LBPropertyBindTintAdjustmentMode {
        guard let property = property.convert(to: UIView.TintAdjustmentMode.self) else {
            return .empty
        }
        if let tintAdjustmentMode = tintAdjustmentMode, tintAdjustmentMode.contains(property) {
            return tintAdjustmentMode
        }
        return LBPropertyBindTintAdjustmentMode(property, &tintAdjustmentMode) { [weak self] in
            self?.view?.tintAdjustmentMode = $0
        }
    }
    /*
     * */
    @discardableResult public func isUserInteractionEnabled<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
        guard let property = property.convert(to: Bool.self) else {
            return .empty
        }
        if let isUserInteractionEnabled = isUserInteractionEnabled, isUserInteractionEnabled.contains(property) {
            return isUserInteractionEnabled
        }
        return LBPropertyBindBool(property, &isUserInteractionEnabled) { [weak self] in
            self?.view?.isUserInteractionEnabled = $0
        }
    }
}
