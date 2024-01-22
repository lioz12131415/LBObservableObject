//
//  NSObject+Extentions.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 10/01/2024.
//

import UIKit
import Foundation

extension NSObject {
    // ============================================= //
    // MARK: -
    // ============================================= //
    var pointer_key: String {
        return "\(Unmanaged.passUnretained(self).toOpaque())"
    }
}
