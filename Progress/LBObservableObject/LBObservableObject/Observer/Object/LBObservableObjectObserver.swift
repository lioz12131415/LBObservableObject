//
//  LBObservableObjectObserver.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 18/01/2024.
//

import UIKit
import Foundation

public class LBObservableObjectObserver: NSObject {
    
    fileprivate var _block: () -> Void = {
        /* */
    }
    
    internal func send() {
        self._block()
    }
    
    public func remove() {
        self._block = { /* */ }
    }
    
    public func onPosted(_ block: @escaping() -> Void) {
        self._block = block
    }
}
