//
//  LBObservableObject+Extentions.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit
import Foundation

extension LBObservableObject {
    // =============================================== //
    // MARK: -
    // =============================================== //
    internal var class_name: String {
        return String(describing: type(of: self))
    }
}
