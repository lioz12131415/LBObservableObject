//
//  LBAnyElementOrder.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public protocol LBAnyElementOrder: Equatable {
    
}

@available(iOS 16.0, *)
extension UIContextMenuConfiguration.ElementOrder:  LBAnyElementOrder { }

@available(iOS 16.0, *)
extension UIContextMenuConfiguration.ElementOrder?: LBAnyElementOrder { }

