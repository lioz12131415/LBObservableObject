//
//  LBObservablePropertyObserverTargets.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 17/01/2024.
//

import UIKit
import Foundation

class LBObservablePropertyObserverTargets {
    
    typealias Storage  = NSMapTable<NSString, LBObservablePropertyObserverDynamic>
    typealias Dynamic  = LBObservablePropertyObserverDynamic
    typealias Observer = LBObservablePropertyObserver
    
    fileprivate var storage: Storage = {
        .init(keyOptions: .strongMemory, valueOptions: .strongMemory)
    }()
    
    internal func get<Value>(_ object: NSObject,
                             _ property: LBObservableProperty<Value>) -> Observer<Value>? {
        return _get(object, property)
    }
    
    internal func remove<Value>(_ object:   NSObject,
                                _ property: LBObservableProperty<Value>) {
        _removeObject(key: property.pointer+object.pointer_key)
    }
}

extension LBObservablePropertyObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _get<Value>(_ object: NSObject,
                                 _ property: LBObservableProperty<Value>) -> Observer<Value>? {
        guard let dynamic = _object(key: property.pointer+object.pointer_key) else {
            return _create(object, property) as? Observer<Value>
        }
        return dynamic as? Observer<Value>
    }
}

extension LBObservablePropertyObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _create<Value>(_ object: NSObject,
                                    _ property: LBObservableProperty<Value>) -> Dynamic? {
        _setObject(Observer<Value>(object, self, property), key: property.pointer+object.pointer_key)
        return _object(key: property.pointer+object.pointer_key)
    }
}

extension LBObservablePropertyObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _object(key: String) -> Dynamic? {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        return storage.object(forKey: key.nsstringValue)
    }
}

extension LBObservablePropertyObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _setObject(_ value: Dynamic, key: String) {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        storage.setObject(value, forKey: key.nsstringValue)
    }
}

extension LBObservablePropertyObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _removeObject( key: String) {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        storage.removeObject(forKey: key.nsstringValue)
    }
}
