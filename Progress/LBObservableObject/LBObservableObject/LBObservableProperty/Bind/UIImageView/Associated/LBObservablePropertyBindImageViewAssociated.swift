//
//  LBObservablePropertyBindImageViewAssociated.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 22/01/2024.
//

import UIKit
import Foundation

// // // // // // // // // // // // // // // //
fileprivate var initialBindTargetKey: UInt8 = 0
// // // // // // // // // // // // // // // //

extension UIImageViewBindProtocol where Self: UIImageView {
    // ================================================ //
    // MARK: -
    // ================================================ //
    public var bind: LBObservablePropertyImageViewBinder<UIImageView> {
        return withUnsafePointer(to: &initialBindTargetKey) {
            if let objc = objc_getAssociatedObject(self, $0) {
                return objc as! LBObservablePropertyImageViewBinder
            }
            else {
                objc_setAssociatedObject(self, $0, LBObservablePropertyImageViewBinder(self), .OBJC_ASSOCIATION_RETAIN)
            }
            return objc_getAssociatedObject(self, $0) as! LBObservablePropertyImageViewBinder
        }
    }
}

public protocol UIImageViewBindProtocol {
    /* */
}

extension UIImageView: UIImageViewBindProtocol {
    /* */
}
