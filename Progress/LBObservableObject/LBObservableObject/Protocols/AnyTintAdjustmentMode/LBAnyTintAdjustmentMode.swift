//
//  LBAnyTintAdjustmentMode.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 22/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyTintAdjustmentMode: Equatable {
    
}

extension UIView.TintAdjustmentMode:  LBAnyTintAdjustmentMode { }
extension UIView.TintAdjustmentMode?: LBAnyTintAdjustmentMode { }
