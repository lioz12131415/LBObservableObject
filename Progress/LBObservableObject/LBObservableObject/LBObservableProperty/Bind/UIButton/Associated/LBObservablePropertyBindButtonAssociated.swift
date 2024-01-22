//
//  LBObservablePropertyBindButtonAssociated.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

// // // // // // // // // // // // // // // //
fileprivate var initialBindTargetKey: UInt8 = 0
// // // // // // // // // // // // // // // //

extension UIButtonBindProtocol where Self: UIButton {
    // ================================================ //
    // MARK: -
    // ================================================ //
    public var bind: LBObservablePropertyButtonBinder<UIButton> {
        return withUnsafePointer(to: &initialBindTargetKey) {
            if let objc = objc_getAssociatedObject(self, $0) {
                return objc as! LBObservablePropertyButtonBinder
            }
            else {
                objc_setAssociatedObject(self, $0, LBObservablePropertyButtonBinder(self), .OBJC_ASSOCIATION_RETAIN)
            }
            return objc_getAssociatedObject(self, $0) as! LBObservablePropertyButtonBinder
        }
    }
}

public protocol UIButtonBindProtocol {
    /* */
}

extension UIButton: UIButtonBindProtocol {
    /* */
}
