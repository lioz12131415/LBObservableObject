//
//  LBAnyBool.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyBool: Equatable {
    
}

extension Bool:  LBAnyBool { }
extension Bool?: LBAnyBool { }
