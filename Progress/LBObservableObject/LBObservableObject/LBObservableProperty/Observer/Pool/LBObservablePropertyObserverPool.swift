//
//  LBObservablePropertyObserverPool.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 17/01/2024.
//

import UIKit
import Foundation

class LBObservablePropertyObserverPool<Value: LBObservablePropertyValueType> {
    
    fileprivate lazy var map: NSMapTable<NSString, LBObservablePropertyObserver<Value>> = {
        .init(keyOptions: .strongMemory, valueOptions: .weakMemory)
    }()
    
    internal func add(_ value: LBObservablePropertyObserver<Value>) {
        objc_sync_enter(map); defer { objc_sync_exit(map) }
        map.setObject(value, forKey: value.pointer_key.nsstringValue)
    }
    
    internal func remove(_ value: LBObservablePropertyObserver<Value>) {
        objc_sync_enter(map); defer { objc_sync_exit(map) }
        map.removeObject(forKey: value.pointer_key.nsstringValue)
    }
    
    internal func all() -> [LBObservablePropertyObserver<Value>]? {
        objc_sync_enter(map); defer { objc_sync_exit(map) }
        return map.objectEnumerator()?.allObjects.compactMap {
            $0 as? LBObservablePropertyObserver
        }
    }
}


