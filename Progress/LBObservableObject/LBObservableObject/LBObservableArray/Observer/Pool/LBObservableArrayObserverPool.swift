//
//  LBObservableArrayObserverPool.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 17/01/2024.
//

import UIKit
import Foundation

class LBObservableArrayObserverPool {
    
    typealias Storage    = NSMapTable<NSString, GroupMap>
    typealias GroupMap   = NSMapTable<NSString, PointerMap>
    typealias PointerMap = NSMapTable<NSString, LBObservableArrayObserverDynamic>
    
    fileprivate static var storage: Storage = {
        .init(keyOptions: .strongMemory, valueOptions: .strongMemory)
    }()

    fileprivate var storage: Storage {
        get { Self.storage            }
        set { Self.storage = newValue }
    }
    
    internal func remove<T>(key: String,
                            group: String, type: T) {
        guard let groupMap = initializeGroupMapIfNeeded(key: "\(type)") else {
            return
        }
        guard let pointerMap = initializePointerMapIfNeeded(groupMap: groupMap, group: group) else {
            return
        }
        objc_sync_enter(pointerMap); defer { objc_sync_exit(pointerMap) }
        pointerMap.removeObject(forKey: key.nsstringValue)
    }
    
    internal func get<T>(key: String,
                         group: String, type: T) -> LBObservableArrayObserverDynamic? {
        guard let groupMap = initializeGroupMapIfNeeded(key: "\(type)") else {
            return nil
        }
        guard let pointerMap = initializePointerMapIfNeeded(groupMap: groupMap, group: group) else {
            return nil
        }
        objc_sync_enter(pointerMap); defer { objc_sync_exit(pointerMap) }
        return pointerMap.object(forKey: key.nsstringValue)
    }
    
    internal func get<T>(group: String, type: T) -> [LBObservableArrayObserverDynamic]? {
        guard let groupMap = initializeGroupMapIfNeeded(key: "\(type)") else {
            return nil
        }
        guard let pointerMap = initializePointerMapIfNeeded(groupMap: groupMap, group: group) else {
            return nil
        }
        objc_sync_enter(pointerMap); defer { objc_sync_exit(pointerMap) }
        return pointerMap.objectEnumerator()?.allObjects.compactMap { $0 as? LBObservableArrayObserverDynamic }
    }
    
    internal func append<T>(key: String,
                            group: String,
                            type: T, _ value: LBObservableArrayObserverDynamic) {
        guard let groupMap = initializeGroupMapIfNeeded(key: "\(type)") else {
            return
        }
        guard let pointerMap = initializePointerMapIfNeeded(groupMap: groupMap, group: group) else {
            return
        }
        objc_sync_enter(pointerMap); defer { objc_sync_exit(pointerMap) }
        pointerMap.setObject(value, forKey: key.nsstringValue)
    }
}

extension LBObservableArrayObserverPool {
    // ================================================== //
    // MARK: -
    // ================================================== //
    fileprivate func initializeGroupMapIfNeeded(key: String) -> GroupMap? {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        guard storage.object(forKey: key.nsstringValue) == nil else {
            return storage.object(forKey: key.nsstringValue)
        }
        storage.setObject(.init(keyOptions: .strongMemory, valueOptions: .strongMemory),
                          forKey: key.nsstringValue)
        return storage.object(forKey: key.nsstringValue)
    }
}

extension LBObservableArrayObserverPool {
    // ================================================== //
    // MARK: -
    // ================================================== //
    fileprivate func initializePointerMapIfNeeded(groupMap: GroupMap, group: String) -> PointerMap? {
        objc_sync_enter(groupMap); defer { objc_sync_exit(groupMap) }
        guard groupMap.object(forKey: group.nsstringValue) == nil else {
            return groupMap.object(forKey: group.nsstringValue)
        }
        groupMap.setObject(.init(keyOptions: .strongMemory, valueOptions: .weakMemory),
                           forKey: group.nsstringValue)
        return groupMap.object(forKey: group.nsstringValue)
    }
}
