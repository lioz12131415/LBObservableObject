//
//  LBObservableArrayObserver.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 17/01/2024.
//

import UIKit
import Foundation

public class LBObservableArrayObserver<Element: LBObservableObject>: NSObject, LBObservableArrayObserverDynamic {
    
    typealias Pool    = LBObservableArrayObserverPool
    typealias LBArray = LBObservableArray<Element>
    typealias Targets = LBObservableArrayObserverTargets
    
    fileprivate /**/ var _key:    String    = ""
    fileprivate /**/ var _group:  String    = ""
    
    fileprivate /**/ var _pool:    Pool      = Pool()
    fileprivate weak var _array:   LBArray?  = nil
    fileprivate weak var _object:  NSObject? = nil
    fileprivate weak var _targets: Targets?  = nil
    
    fileprivate var block: () -> Void = {
        /* Use If Needed */
    }
    
    internal override init() {
        super.init()
    }
    
    internal init(_ object: NSObject, _ array: LBArray, _ targets: Targets) {
        super.init()
        self._array   = array
        self._object  = object
        self._targets = targets
    }
    
    @discardableResult public func remove() -> Self {
        self._targets?.remove(_array, object: _object)
        return self
    }
    
    @discardableResult public func post(toGroup group: String) -> Self {
        self._change([group])
        return self
    }
    
    @discardableResult public func attach(toGroup group: String) -> Self {
        self._attach(group)
        return self
    }
    
    @discardableResult public func post(toGroups groups: [String])  -> Self {
        self._change(groups)
        return self
    }
        
    @discardableResult public func onPosted(_ block: @escaping() -> Void) -> Self {
        self.block = block
        return self
    }
    
    @discardableResult public func post_items_changes(toGroup group: String)  -> Self {
        self._change_items([group])
        return self
    }
    
    @discardableResult public func post_items_changes(toGroups groups: [String])  -> Self {
        self._change_items(groups)
        return self
    }
}

extension LBObservableArrayObserver {
    // =========================================== //
    // MARK: -
    // =========================================== //
    fileprivate func _attach(_ group: String) {
        guard let array  = _array,
              let object = _object else {
            return
        }
        if !_group.isEmpty && !_key.isEmpty {
            _pool.remove(key: _key, group: _group, type: Element.self)
        }
        self._key   = array.pointer_key+object.pointer_key
        self._group = group
        self._pool.append(key: _key, group: group, type: Element.self, self)
    }
}

extension LBObservableArrayObserver {
    // =========================================== //
    // MARK: -
    // =========================================== //
    fileprivate func _change(_ groups: [String]) {
        groups.forEach { g in
            self._pool.get(group: g, type: Element.self)?.forEach { o in
                self._change(observer: o as? LBObservableArrayObserver, to: self, group: g)
            }
        }
    }
}

extension LBObservableArrayObserver {
    // =========================================== //
    // MARK: -
    // =========================================== //
    fileprivate func _change(observer o0: LBObservableArrayObserver?, to o1: LBObservableArrayObserver, group: String) {
        guard let o0 = o0,
              let a0 = o1._array else {
            return
        }
        if group == _group {
            return self.block()
        }
        o0._array?.elements = a0.map {
            let copy = $0.reflection(group: group)
            return copy
        }
        o0.block()
    }
}

extension LBObservableArrayObserver {
    // =========================================== //
    // MARK: -
    // =========================================== //
    fileprivate func _change_items(_ groups: [String]) {
        groups.forEach { g in
            self._pool.get(group: g, type: Element.self)?.forEach { o in
                self._change_items(observer: o as? LBObservableArrayObserver, to: self, group: g)
            }
        }
    }
}

extension LBObservableArrayObserver {
    // =========================================== //
    // MARK: -
    // =========================================== //
    fileprivate func _change_items(observer o0: LBObservableArrayObserver?, to o1: LBObservableArrayObserver, group: String) {
        guard let o0 = o0,
              let a0 = o1._array else {
            return
        }
        if group == _group {
            return self.block()
        }
        a0.forEach { arg in
            if let item = o0._array?.first(where: { $0.observable_id == arg.observable_id }) {
                item.copy(from: arg)
            }
        }
        o0.block()
    }
}
