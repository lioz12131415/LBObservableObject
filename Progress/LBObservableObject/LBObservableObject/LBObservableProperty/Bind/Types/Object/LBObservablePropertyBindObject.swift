//
//  LBObservablePropertyBindObject.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 19/01/2024.
//

import UIKit
import Foundation

public class LBObservablePropertyBindObject<Value: LBObservablePropertyValueType>: NSObject {
    
    typealias Block0   = (/***/) -> Void
    typealias Block1   = (Value) -> Void
    typealias Property = LBObservableProperty<Value>
    typealias Observer = LBObservablePropertyObserver<Value>
    
    internal /**/ var _block0:    Block0?   = nil
    internal /**/ var _block1:    Block1?   = nil
    internal weak var _observer:  Observer? = nil
    internal weak var _property:  Property? = nil

    internal override init() {
        super.init()
    }
    
    internal required init(_ property: Property,
                           _ body: @escaping(Value) -> Void) {
        super.init()
        self._property = property
        self._observer = property.observe(self)
        self._observe(body)
    }
    /*
     * */
    public func remove() {
        self._observer?.remove()
    }
    /*
     * */
    public func onChange(_ block: @escaping() -> Void) {
        self._block0 = block
    }
    /*
     * */
    public func onChange(_ block: @escaping(_ newValue: Value) -> Void) {
        self._block1 = block
    }

    deinit {
        self._observer?.remove()
    }
}

extension LBObservablePropertyBindObject {
    // =============================================== //
    // MARK: -
    // =============================================== //
    fileprivate func _observe(_ _wrappedValue: @escaping(Value) -> Void) {
        _observer?.onChange { [weak self] newValue in
            guard let self else {
                return
            }
            _wrappedValue(newValue)
            _block1?(newValue)
            _block0?()
        }
        if let value = _property?.wrappedValue {
            _wrappedValue(value)
        }
    }
}

