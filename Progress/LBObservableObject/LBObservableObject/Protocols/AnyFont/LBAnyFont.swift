//
//  LBAnyFont.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyFont: Equatable {
    
}

extension UIFont:  LBAnyFont { }
extension UIFont?: LBAnyFont { }
