//
//  LBObservableObjectPropertyDynamic.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit
import Foundation

@objc protocol LBObservableObjectPropertyDynamic {
    
}

extension LBObservableObjectPropertyDynamic {
    // ============================================== //
    // MARK: -
    // ============================================== //
    internal func pointer_key() -> String {
        return "\(Unmanaged.passUnretained(self).toOpaque())"
    }
}
