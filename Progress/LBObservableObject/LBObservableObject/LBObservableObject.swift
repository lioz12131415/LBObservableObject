//
//  LBObservableObject.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit
import Foundation

open class LBObservableObject: NSObject {
    
    typealias Pool       = _LBObservableObjectPool
    typealias Mirror     = _LBObservableObjectMirror
    typealias Observer   = _LBObservableObjectObserver
    typealias Properties = _LBObservableObjectProperties
            
    fileprivate var __id:    String = ""
    fileprivate var __group: String = ""
    
    internal var pool:       Pool       = .new
    internal var mirror:     Mirror     = .new
    internal var observer:   Observer   = .new
    internal var properties: Properties = .new
    
    public var observable_id: String {
        return __id
    }
    
    public var observable_group: String {
        return __group
    }
    
    public required override init() {
        super.init()
        self.mirror.reflaction(object: self)
    }
    
    @discardableResult public func post(toGroup group: String) -> Self {
        self.change([group])
        return self
    }
    
    @discardableResult public func post(toGroups groups: [String]) -> Self {
        self.change(groups)
        return self
    }
    
    @discardableResult public func reflection(group: String? = nil) -> Self {
        let t = Self().copy(from: self, group: group)
        return t
    }
    
    @discardableResult public func copy(from object: LBObservableObject, group: String? = nil) -> Self {
        self.mirror.copy(from: object, to: self, group: group)
        return self
    }
      
    @discardableResult public func attach(id: String, toGroup group: String) -> Self {
        guard !id.isEmpty && !group.isEmpty else {
            return self
        }
        if !self.__id.isEmpty && !self.__group.isEmpty {
            self.pool.remove(id: self.__id, group: self.__group, self)
        }
        self.__id    = id
        self.__group = group
        self.pool.append(id: id, group: group, self)
        return self
    }
}


extension LBObservableObject {
    // ============================================== //
    // MARK: -
    // ============================================== //
    fileprivate func change(_ groups: [String]) {
        groups.forEach {
            pool.get(id: self.observable_id, group: $0, self).forEach {
                $0.copy(from: self)
                $0.observer.send()
            }
        }
    }
}
