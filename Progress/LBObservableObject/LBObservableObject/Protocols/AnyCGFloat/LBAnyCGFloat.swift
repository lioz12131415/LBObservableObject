//
//  LBAnyCGFloat.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyCGFloat: Equatable {
    
}

extension CGFloat:  LBAnyCGFloat { }
extension CGFloat?: LBAnyCGFloat { }
