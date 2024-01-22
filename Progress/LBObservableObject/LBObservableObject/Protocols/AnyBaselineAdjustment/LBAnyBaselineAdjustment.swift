//
//  LBAnyBaselineAdjustment.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyBaselineAdjustment: Equatable {
    
}

extension UIBaselineAdjustment:  LBAnyBaselineAdjustment { }
extension UIBaselineAdjustment?: LBAnyBaselineAdjustment { }
