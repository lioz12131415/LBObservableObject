//
//  LBAnyColor.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyColor: Equatable {
    
}

extension UIColor:  LBAnyColor { }
extension UIColor?: LBAnyColor { }
