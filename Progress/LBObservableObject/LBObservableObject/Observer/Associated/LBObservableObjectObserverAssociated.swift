//
//  LBObservableObjectObserverAssociated.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 18/01/2024.
//

import UIKit
import Foundation

// // // // // // // // // // // // // // // // // //
fileprivate var initialObserverTargetsKey: UInt8 = 0
// // // // // // // // // // // // // // // // // //

fileprivate typealias Targets  = LBObservableObjectObserverTargets
fileprivate typealias Observer = LBObservableObjectObserver

extension LBObservableObject {
    // ============================================== //
    // MARK: -
    // ============================================== //
    public func observe<Target: NSObject>(_ target: Target) -> LBObservableObjectObserver {
        return observer.observe(target, self)
    }
}

extension _LBObservableObjectObserver {
    // ============================================== //
    // MARK: -
    // ============================================== //
    fileprivate func observe<Target: NSObject>(_ target:     Target,
                                               _ observable: LBObservableObject) -> Observer {
        let observer = target.observe(observable)
        return add(observer)
    }
}

extension NSObject {
    // ============================================== //
    // MARK: -
    // ============================================== //
    fileprivate func observe(_ observable: LBObservableObject) -> Observer {
        let object = withUnsafePointer(to: &initialObserverTargetsKey) {
            if let objc = objc_getAssociatedObject(self, $0) {
                return objc as! Targets
            }
            else {
                objc_setAssociatedObject(self, $0, Targets(), .OBJC_ASSOCIATION_RETAIN)
            }
            return objc_getAssociatedObject(self, $0) as! Targets
        }
        return object.get(self, observable) ?? Observer()
    }
}
