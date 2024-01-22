//
//  LBAnyImage.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyImage: Equatable {
    
}

extension UIImage:  LBAnyImage { }
extension UIImage?: LBAnyImage { }
