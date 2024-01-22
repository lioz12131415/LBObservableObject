//
//  LBObservableObjectObserverPool.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 18/01/2024.
//

import UIKit
import Foundation

class LBObservableObjectObserverPool {
    
    fileprivate lazy var map: NSMapTable<NSString, LBObservableObjectObserver> = {
        .init(keyOptions: .strongMemory, valueOptions: .weakMemory)
    }()
    
    internal func add(_ value: LBObservableObjectObserver) {
        objc_sync_enter(map); defer { objc_sync_exit(map) }
        map.setObject(value, forKey: value.pointer_key.nsstringValue)
    }
    
    internal func remove(_ value: LBObservableObjectObserver) {
        objc_sync_enter(map); defer { objc_sync_exit(map) }
        map.removeObject(forKey: value.pointer_key.nsstringValue)
    }
    
    internal func all() -> [LBObservableObjectObserver]? {
        objc_sync_enter(map); defer { objc_sync_exit(map) }
        return map.objectEnumerator()?.allObjects.compactMap {
            $0 as? LBObservableObjectObserver
        }
    }
}
