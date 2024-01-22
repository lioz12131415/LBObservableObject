//
//  LBAnyButtonRole.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyButtonRole: Equatable {
    
}

extension UIButton.Role:  LBAnyButtonRole { }
extension UIButton.Role?: LBAnyButtonRole { }

