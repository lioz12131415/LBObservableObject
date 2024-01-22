//
//  LBObservablePropertyBindViewAssociated.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 22/01/2024.
//

import UIKit
import Foundation

// // // // // // // // // // // // // // // //
fileprivate var initialBindTargetKey: UInt8 = 0
// // // // // // // // // // // // // // // //

extension UIViewBindProtocol where Self: UIView {
    // ================================================ //
    // MARK: -
    // ================================================ //
    public var bind: LBObservablePropertyViewBinder<UIView> {
        return withUnsafePointer(to: &initialBindTargetKey) {
            if let objc = objc_getAssociatedObject(self, $0) {
                return objc as! LBObservablePropertyViewBinder
            }
            else {
                objc_setAssociatedObject(self, $0, LBObservablePropertyViewBinder(self), .OBJC_ASSOCIATION_RETAIN)
            }
            return objc_getAssociatedObject(self, $0) as! LBObservablePropertyViewBinder
        }
    }
}

public protocol UIViewBindProtocol {
    /* */
}

extension UIView: UIViewBindProtocol {
    /* */
}

