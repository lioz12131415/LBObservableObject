//
//  LBObservableArrayObserverTargets.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 17/01/2024.
//

import UIKit
import Foundation

class LBObservableArrayObserverTargets {
    
    typealias Storage = NSMapTable<NSString, LBObservableArrayObserverDynamic>
    typealias Dynamic = LBObservableArrayObserverDynamic
    typealias LBArray = LBObservableArray
    
    fileprivate var storage: Storage = {
        .init(keyOptions: .strongMemory, valueOptions: .strongMemory)
    }()
    
    internal func get<Element>(_ array: LBArray<Element>, object: NSObject) -> LBObservableArrayObserver<Element>? {
        return _get(array, object: object)
    }
    
    internal func remove<Element>(_ array: LBArray<Element>?, object: NSObject?) {
        guard let array  = array,
              let object = object else {
            return
        }
        _removeObject(key: array.pointer_key+object.pointer_key)
    }
}

extension LBObservableArrayObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _get<Element>(_ array: LBArray<Element>, object: NSObject) -> LBObservableArrayObserver<Element>? {
        guard let dynamic = _object(key: array.pointer_key+object.pointer_key) else {
            return _create(array, object: object) as? LBObservableArrayObserver<Element>
        }
        return dynamic as? LBObservableArrayObserver<Element>
    }
}

extension LBObservableArrayObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _create<Element>(_ array: LBArray<Element>, object: NSObject) -> Dynamic? {
        _setObject(LBObservableArrayObserver(object, array, self), key: array.pointer_key+object.pointer_key)
        return _object(key: array.pointer_key+object.pointer_key)
    }
}

extension LBObservableArrayObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _object(key: String) -> Dynamic? {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        return storage.object(forKey: key.nsstringValue)
    }
}

extension LBObservableArrayObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _setObject(_ value: Dynamic, key: String) {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        storage.setObject(value, forKey: key.nsstringValue)
    }
}

extension LBObservableArrayObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _removeObject( key: String) {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        storage.removeObject(forKey: key.nsstringValue)
    }
}
