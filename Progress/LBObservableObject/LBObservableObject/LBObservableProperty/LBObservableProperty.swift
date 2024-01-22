//
//  LBObservableProperty.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit
import Foundation

@propertyWrapper public class LBObservableProperty<Value: LBObservablePropertyValueType>: NSObject, LBObservablePropertyDataSource, LBObservableObjectPropertyDynamic {

    typealias Pool     = _LBObservableObjectPool
    typealias Observer = _LBObservablePropertyObserver
        
    internal var pool: Pool? {
        return parent?.pool
    }
    
    internal var value: Any? {
        didSet { set(value) }
    }
    
    internal var uuid: String {
        didSet { }
    }
    
    internal var pointer: String {
        return pointer_key()
    }
        
    internal var label: String = .empty {
        didSet { }
    }

    internal var observer: Observer<Value> {
        didSet { }
    }
    
    internal weak var parent: LBObservableObject? {
        didSet { }
    }
    
    public var wrappedValue: Value {
        didSet { set(wrappedValue, oldValue) }
    }
    
    public var projectedValue: LBObservableProperty<Value> {
        return self
    }
    
    public init(wrappedValue: Value) {
        self.uuid         = UUID().uuidString
        self.observer     = Observer()
        self.wrappedValue = wrappedValue
    }

    public func post(toGroup group: String) {
        self.change([group])
    }
    
    public func post(toGroups groups: [String]) {
        self.change(groups)
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? LBObservableProperty<Value> else {
            return false
        }
        return other.uuid == uuid
    }
}

extension LBObservableProperty {
    // ============================================== //
    // MARK: -
    // ============================================== //
    fileprivate func set(_ value: Any?) {
        guard let value = value as? LBObservableProperty<Value> else {
            return
        }
        wrappedValue = value.wrappedValue
    }
}

extension LBObservableProperty {
    // ============================================== //
    // MARK: -
    // ============================================== //
    fileprivate func set(_ newValue: Value, _ oldValue: Value) {
        guard newValue != oldValue else {
            return
        }
        observer.send(newValue)
    }
}

extension LBObservableProperty {
    // ============================================== //
    // MARK: -
    // ============================================== //
    fileprivate func change(_ groups: [String]) {
        guard let parent = parent else {
            return
        }
        groups.forEach {
            let objects = pool?.get(id: parent.observable_id, group: $0, parent)
            
            objects?.forEach {
                let property = $0.properties.get(label: label) as? LBObservableProperty<Value>
                
                if property?.wrappedValue != wrappedValue {
                    property?.wrappedValue = wrappedValue
                }
            }
        }
    }
}
