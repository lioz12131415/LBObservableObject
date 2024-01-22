//
//  LBObservableObjectObserverTargets.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 18/01/2024.
//

import UIKit
import Foundation

class LBObservableObjectObserverTargets {
    
    typealias Storage  = NSMapTable<NSString, LBObservableObjectObserver>
    typealias Observer = LBObservableObjectObserver
    
    fileprivate var storage: Storage = {
        .init(keyOptions: .strongMemory, valueOptions: .strongMemory)
    }()
    
    internal func get(_ object:     NSObject,
                      _ observable: LBObservableObject) -> Observer? {
        return _get(object, observable)
    }
}

extension LBObservableObjectObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _get(_ object:     NSObject,
                          _ observable: LBObservableObject) -> Observer? {
        guard let observer = _object(key: observable.pointer_key+object.pointer_key) else {
            return _create(object, observable)
        }
        return observer
    }
}

extension LBObservableObjectObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _create(_ object:     NSObject,
                             _ observable: LBObservableObject) -> Observer? {
        _setObject(Observer(), key: observable.pointer_key+object.pointer_key)
        return _object(key: observable.pointer_key+object.pointer_key)
    }
}

extension LBObservableObjectObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _object(key: String) -> Observer? {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        return storage.object(forKey: key.nsstringValue)
    }
}

extension LBObservableObjectObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _setObject(_ value: Observer, key: String) {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        storage.setObject(value, forKey: key.nsstringValue)
    }
}

extension LBObservableObjectObserverTargets {
    // ============================================ //
    // MARK: -
    // ============================================ //
    fileprivate func _removeObject( key: String) {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        storage.removeObject(forKey: key.nsstringValue)
    }
}
