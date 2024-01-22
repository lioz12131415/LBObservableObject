//
//  LBObservableArrayObserverAssociated.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 17/01/2024.
//

import UIKit
import Foundation

fileprivate var initialObserverTargetsKey: UInt8 = 0

extension  LBObservableArray where Element: LBObservableObject {
    // ============================================== //
    // MARK: -
    // ============================================== //
    public func observe<Target: NSObject>(_ target: Target) -> LBObservableArrayObserver<Element> {
        return target.observe(self)
    }
}

extension NSObject {
    // ============================================== //
    // MARK: -
    // ============================================== //
    fileprivate func observe<Element: LBObservableObject>(_ array: LBObservableArray<Element>
    ) -> LBObservableArrayObserver<Element> {
        let object = withUnsafePointer(to: &initialObserverTargetsKey) {
            if let objc = objc_getAssociatedObject(self, $0) {
                return objc as! LBObservableArrayObserverTargets
            }
            else {
                objc_setAssociatedObject(self, $0, LBObservableArrayObserverTargets(), .OBJC_ASSOCIATION_RETAIN)
            }
            return objc_getAssociatedObject(self, $0) as! LBObservableArrayObserverTargets
        }
        return object.get(array, object: self) ?? LBObservableArrayObserver<Element>()
    }
}
