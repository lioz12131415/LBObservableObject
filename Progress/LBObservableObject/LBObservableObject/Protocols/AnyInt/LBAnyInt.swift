//
//  LBAnyInt.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyInt: Equatable {
    
}

extension Int:  LBAnyInt { }
extension Int?: LBAnyInt { }
