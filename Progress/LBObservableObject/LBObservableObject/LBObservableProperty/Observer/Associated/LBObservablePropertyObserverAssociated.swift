//
//  LBObservablePropertyObserverAssociated.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 17/01/2024.
//

import UIKit
import Foundation

// // // // // // // // // // // // // // // // // //
fileprivate var initialObserverTargetsKey: UInt8 = 0
// // // // // // // // // // // // // // // // // //

fileprivate typealias Targets  = LBObservablePropertyObserverTargets
fileprivate typealias Observer = LBObservablePropertyObserver

extension LBObservableProperty {
    // ============================================== //
    // MARK: -
    // ============================================== //
    public func observe<Target: NSObject>(_ target: Target) -> LBObservablePropertyObserver<Value> {
        return observer.observe(target, self)
    }
}

extension _LBObservablePropertyObserver {
    // ============================================== //
    // MARK: -
    // ============================================== //
    fileprivate func observe<Target: NSObject>(_ target:   Target,
                                               _ property: LBObservableProperty<Value>) -> Observer<Value> {
        let observer = target.targets().get(target, property) ?? Observer()
        return add(observer)
    }
}

extension NSObject {
    // ============================================== //
    // MARK: -
    // ============================================== //
    fileprivate func targets() -> Targets {
        let targets = withUnsafePointer(to: &initialObserverTargetsKey) {
            if let objc = objc_getAssociatedObject(self, $0) {
                return objc as! Targets
            }
            else {
                objc_setAssociatedObject(self, $0, Targets(), .OBJC_ASSOCIATION_RETAIN)
            }
            return objc_getAssociatedObject(self, $0) as! Targets
        }
        return targets
    }
}


