//
//  FieldReflectionMetadata.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import Foundation

typealias NameFreeFunc = @convention(c) (UnsafePointer<CChar>?) -> Void

struct FieldReflectionMetadata {
    let name: UnsafePointer<CChar>? = nil
    let freeFunc: NameFreeFunc? = nil
    let isStrong: Bool = false
    let isVar: Bool = false
}
