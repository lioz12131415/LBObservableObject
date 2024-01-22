//
//  _LBObservablePropertyObserver.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 17/01/2024.
//

import UIKit
import Foundation

class _LBObservablePropertyObserver<Value: LBObservablePropertyValueType> {
    
    typealias Pool     = LBObservablePropertyObserverPool
    typealias Observer = LBObservablePropertyObserver
    
    fileprivate var pool: Pool<Value> = {
        Pool()
    }()
    
    @discardableResult func remove(_ value: Observer<Value>) -> Observer<Value> {
        pool.remove(value)
        return value
    }
    
    @discardableResult func add(_ value: Observer<Value>) -> Observer<Value> {
        pool.add(value)
        return value
    }
    
    internal func send(_ newValue: Value) {
        pool.all()?.forEach {
            $0.send(newValue)
        }
    }
}



