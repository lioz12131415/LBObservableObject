//
//  LBAnyTextAlignment.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyTextAlignment: Equatable {
    
}

extension NSTextAlignment:  LBAnyTextAlignment { }
extension NSTextAlignment?: LBAnyTextAlignment { }
