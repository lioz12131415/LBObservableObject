//
//  LBObservablePropertyBind.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 19/01/2024.
//

import UIKit
import Foundation

public class LBObservablePropertyBind<Value:    LBObservablePropertyValueType,
                                      Delegate: LBObservablePropertyBindProtocol>: NSObject {
    
    typealias Body       = (Value) -> Void
    typealias Property   = LBObservableProperty<Value>
    typealias UMPointer  = UnsafeMutablePointer<Delegate?>
    typealias BindObject = LBObservablePropertyBindObject<Value>
    
    internal /**/ var object:   BindObject? = nil
    internal /**/ var pointer:  UMPointer?  = nil
    internal weak var property: Property?   = nil
    
    internal weak var delegate: Delegate? {
        get { pointer?.pointee            }
        set { pointer?.pointee = newValue }
    }
    
    internal override init() {
        super.init()
    }
    
    internal required init(_ property: Property, _ delegate: inout Delegate?, _ body: @escaping Body) {
        super.init()
        self.object   = LBObservablePropertyBindObject(property, body)
        self.pointer  = withUnsafeMutablePointer(to: &delegate, { $0 })
        self.property = property
        self.attach(&delegate)
    }
    /*
     * */
    public func remove() {
        self.remove(&delegate)
    }
    /*
     * */
    public func onChange(_ block: @escaping() -> Void) {
        self.object?.onChange(block)
    }
    /*
     * */
    public func onChange(_ block: @escaping(_ newValue: Value) -> Void) {
        self.object?.onChange(block)
    }
    /*
     * */
    public func contains(_ other: LBObservableProperty<Value>?) -> Bool {
        return property?.isEqual(other) ?? false
    }
    /*
     * */
    public func contains(_ other: LBObservableProperty<Value?>?) -> Bool {
        return property?.isEqual(other) ?? false
    }
    /*
     * */
    internal func remove(_ delegate: inout Delegate?) {
        delegate = nil
    }
    /*
     * */
    internal func attach(_ delegate: inout Delegate?) {
        delegate = self as? Delegate
    }
}

public protocol LBObservablePropertyBindProtocol: AnyObject {
    /*
     *
     * */
}

