//
//  _LBObservableObjectProperties.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit
import Foundation

class _LBObservableObjectProperties {
    
    typealias Storage  = NSMapTable<NSString, LBObservableObjectPropertyDynamic>
    typealias Property = LBObservableObjectPropertyDynamic
    
    fileprivate var storage: Storage = {
        .init(keyOptions: .strongMemory, valueOptions: .weakMemory)
    }()
    
    internal func append(label: String, property: Property) {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        storage.setObject(property, forKey: label.nsstringValue)
    }

    internal func remove(label: String, property: Property) {
        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
        storage.removeObject(forKey: label.nsstringValue)
    }
    
    internal func get(label: String) -> Property? {
        storage.object(forKey: label.nsstringValue)
    }
}

extension _LBObservableObjectProperties {
    // ================================================== //
    // MARK: -
    // ================================================== //
    internal static var new: _LBObservableObjectProperties {
        return _LBObservableObjectProperties()
    }
}
