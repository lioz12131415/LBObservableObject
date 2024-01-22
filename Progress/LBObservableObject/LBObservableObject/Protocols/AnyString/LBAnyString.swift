//
//  LBAnyString.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyString: Equatable {
    
}

extension String:  LBAnyString { }
extension String?: LBAnyString { }
