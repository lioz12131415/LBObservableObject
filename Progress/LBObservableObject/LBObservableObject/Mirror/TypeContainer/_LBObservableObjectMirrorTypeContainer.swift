//
//  _LBObservableObjectMirrorTypeContainer.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import Foundation

struct _LBObservableObjectMirrorTypeContainer {
    
    typealias Accessors = _LBObservableObjectMirrorAccessors
    
    let type: Any.Type
    let witnessTable = 0
    /*
     * */
    init(type: Any.Type) {
        self.type = type
    }
    /*
     * */
    var accessors: Accessors.Type {
        unsafeBitCast(self, to: Accessors.Type.self)
    }
}
