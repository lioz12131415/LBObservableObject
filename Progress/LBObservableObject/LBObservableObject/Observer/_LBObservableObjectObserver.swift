//
//  _LBObservableObjectObserver.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 18/01/2024.
//

import UIKit
import Foundation

class _LBObservableObjectObserver {
    
    typealias Pool     = LBObservableObjectObserverPool
    typealias Observer = LBObservableObjectObserver
    
    fileprivate var pool: Pool = {
        Pool()
    }()
    
    @discardableResult func remove(_ value: Observer) -> Observer {
        pool.remove(value)
        return value
    }
    
    @discardableResult func add(_ value: Observer) -> Observer {
        pool.add(value)
        return value
    }
    
    internal func send() {
        pool.all()?.forEach {
            $0.send()
        }
    }
}

extension _LBObservableObjectObserver {
    // ================================================== //
    // MARK: -
    // ================================================== //
    internal static var new: _LBObservableObjectObserver {
        return _LBObservableObjectObserver()
    }
}
