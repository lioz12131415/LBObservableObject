//
//  _LBObservableObjectPool.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit
import Foundation

internal class _LBObservableObjectPool {
    
    typealias Storage = NSMapTable<NSString, NSMapTable<NSString, NSMapTable<NSString, LBObservableObject>>>

    fileprivate static var storage: Storage = {
        .init(keyOptions: .strongMemory, valueOptions: .strongMemory)
    }()

    fileprivate var storage: Storage {
        get { Self.storage            }
        set { Self.storage = newValue }
    }

    internal func remove(id: String, group: String, _ value: LBObservableObject) {
        guard let storage = initializeIfNeeded(key: "\(value.class_name)-\(id)") else {
            return
        }
        guard let map = initializeMapIfNeeded(storage: storage, group: group) else {
            return
        }
        objc_sync_enter(map); defer { objc_sync_exit(map) }
        map.removeObject(forKey: value.pointer_key.nsstringValue)
    }
    
    internal func append(id: String, group: String, _ value: LBObservableObject) {
        guard let storage = initializeIfNeeded(key: "\(value.class_name)-\(id)") else {
            return
        }
        guard let map = initializeMapIfNeeded(storage: storage, group: group) else {
            return
        }
        objc_sync_enter(map); defer { objc_sync_exit(map) }
        map.setObject(value, forKey: value.pointer_key.nsstringValue)
    }
    
    internal func get(id: String, group: String, _ value: LBObservableObject) -> [LBObservableObject] {
        guard let storage = initializeIfNeeded(key: "\(value.class_name)-\(id)") else {
            return []
        }
        guard let map = initializeMapIfNeeded(storage: storage, group: group) else {
            return []
        }
        objc_sync_enter(map); defer { objc_sync_exit(map) }
        return map.objectEnumerator()?.allObjects.compactMap { $0 as? LBObservableObject } ?? []
    }
}

extension _LBObservableObjectPool {
    // ================================================== //
    // MARK: -
    // ================================================== //
    fileprivate func initializeIfNeeded(key: String) -> NSMapTable<NSString, NSMapTable<NSString, LBObservableObject>>? {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        guard storage.object(forKey: key.nsstringValue) == nil else {
            return storage.object(forKey: key.nsstringValue)
        }
        storage.setObject(.init(keyOptions: .strongMemory, valueOptions: .strongMemory),
                       forKey: key.nsstringValue)
        return storage.object(forKey: key.nsstringValue)
    }
}

extension _LBObservableObjectPool {
    // ================================================== //
    // MARK: -
    // ================================================== //
    fileprivate func initializeMapIfNeeded(storage: NSMapTable<NSString, NSMapTable<NSString, LBObservableObject>>,
                                           group: String) -> NSMapTable<NSString, LBObservableObject>? {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        guard storage.object(forKey: group.nsstringValue) == nil else {
            return storage.object(forKey: group.nsstringValue)
        }
        storage.setObject(.init(keyOptions: .strongMemory, valueOptions: .weakMemory), forKey: group.nsstringValue)
        return storage.object(forKey: group.nsstringValue)
    }
}

extension _LBObservableObjectPool {
    // ================================================== //
    // MARK: -
    // ================================================== //
    internal static var new: _LBObservableObjectPool {
        return _LBObservableObjectPool()
    }
}


