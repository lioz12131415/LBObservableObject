//
//  LBObservablePropertyObserver.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 17/01/2024.
//

import UIKit
import Foundation

public class LBObservablePropertyObserver<Value: LBObservablePropertyValueType>: NSObject, LBObservablePropertyObserverDynamic {
    
    typealias Targets  = LBObservablePropertyObserverTargets
    typealias Property = LBObservableProperty<Value>
    
    fileprivate /**/ var _block0: (/* */) -> Void = { /* */ }
    fileprivate /**/ var _block1: (Value) -> Void = { _ in  }
    
    fileprivate weak var _object:   NSObject? = nil
    fileprivate weak var _targets:  Targets?  = nil
    fileprivate weak var _property: Property? = nil
    
    internal init(_ object:   NSObject? = nil,
                  _ targets:  Targets?  = nil,
                  _ property: Property? = nil) {
        self._object   = object
        self._targets  = targets
        self._property = property
    }
    
    internal func send(_ newValue: Value) {
        self._block0()
        self._block1(newValue)
    }
    
    public func remove() {
        self._remove()
    }
    
    public func onChange(_ block: @escaping() -> Void) {
        self._block0 = block
    }
    
    public func onChange(_ block: @escaping(_ newValue: Value) -> Void) {
        self._block1 = block
    }
}

extension LBObservablePropertyObserver {
    // ======================================================== //
    // MARK: -
    // ======================================================== //
    fileprivate func _remove() {
        _block0 = { /* */ }
        _block1 = { _ in  }
        
        if let object   = _object,
           let property = _property {
            _targets?.remove(object, property)
            _property?.observer.remove(self)
        }
    }
}

@objc protocol LBObservablePropertyObserverDynamic {
    /* * * */
}
