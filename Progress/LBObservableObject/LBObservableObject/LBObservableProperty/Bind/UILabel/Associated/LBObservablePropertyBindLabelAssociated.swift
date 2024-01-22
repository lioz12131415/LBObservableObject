//
//  LBObservablePropertyBindLabelAssociated.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 19/01/2024.
//

import UIKit
import Foundation

// // // // // // // // // // // // // // // //
fileprivate var initialBindTargetKey: UInt8 = 0
// // // // // // // // // // // // // // // //

extension UILabelBindProtocol where Self: UILabel {
    // ================================================ //
    // MARK: -
    // ================================================ //
    public var bind: LBObservablePropertyLabelBinder<UILabel> {
        return withUnsafePointer(to: &initialBindTargetKey) {
            if let objc = objc_getAssociatedObject(self, $0) {
                return objc as! LBObservablePropertyLabelBinder
            }
            else {
                objc_setAssociatedObject(self, $0, LBObservablePropertyLabelBinder(self), .OBJC_ASSOCIATION_RETAIN)
            }
            return objc_getAssociatedObject(self, $0) as! LBObservablePropertyLabelBinder
        }
    }
}

public protocol UILabelBindProtocol {
    /* */
}

extension UILabel: UILabelBindProtocol {
    /* */
}
