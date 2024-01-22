//
//  _LBObservableObjectMirror.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit
import Foundation

class _LBObservableObjectMirror {
    
    typealias Metadata      = FieldReflectionMetadata
    typealias Pointer       = _LBObservableObjectMirrorPointer
    typealias Accessors     = _LBObservableObjectMirrorAccessors
    typealias TypeContainer = _LBObservableObjectMirrorTypeContainer
 
    /*
     *
     * * */
    internal func copy(from objc0: Any, to objc1: Any, group: String? = nil) {
        if let group   = group,
           let object0 = objc0 as? LBObservableObject,
           let object1 = objc1 as? LBObservableObject {
            object1.attach(id: object0.observable_id, toGroup: group)
        }
        for child in Mirror(reflecting: objc0).children {
            guard let label = child.label else {
                return
            }
            copy(value: child.value, into: objc1, with: label, group: group)
        }
    }
    
    /*
     *
     * * */
    internal func reflaction(object: LBObservableObject) {
        for child in Mirror(reflecting: object).children {
            guard let label    = child.label,
                  var value    = child.value as? (any LBObservablePropertyDataSource),
                  let property = child.value as? LBObservableObjectPropertyDynamic else {
                continue
            }
            value.label  = label
            value.parent = object
            object.properties.append(label: label, property: property)
        }
    }
}

extension _LBObservableObjectMirror {
    // =========================================== //
    // MARK: -
    // =========================================== //
    fileprivate func copy(value: Any, into objc: Any, with label: String, group: String? = nil) {
        guard Mirror.isClass(objc) || Mirror.isStruct(objc) else {
            return
        }
        let type  = type(of: objc)
        let count = swift_reflectionMirror_recursiveCount(type)
        
        loop(type: type, count: count, value: value, label: label, objc: objc, group: group)
    }
}

extension _LBObservableObjectMirror {
    // =========================================== //
    // MARK: -
    // =========================================== //
    fileprivate func loop(type t: Any.Type, count c: Int, value v: Any?, label l: String, objc o: Any, group g: String? = nil) {
        for i in 0..<c {
            var metadata = FieldReflectionMetadata()
            let type     = swift_reflectionMirror_recursiveChildMetadata(t, index: i, fieldMetadata: &metadata)
            
            defer {
                metadata.freeFunc?(metadata.name)
            }
            guard let name = metadata.name.flatMap ({ String(validatingUTF8: $0) }), name == l else {
                continue
            }
            var this   = o
            let offset = swift_reflectionMirror_recursiveChildOffset(t, index: i)
            
            try? Pointer.with(&this) { pointer in
                let container    = TypeContainer(type: type)
                let valuePointer = pointer.advanced(by: offset)
                /*
                 * */
                container.accessors.set(value: v, in: valuePointer, group: g)
            }
            break
        }
    }
}

extension _LBObservableObjectMirror {
    // =========================================== //
    // MARK: -
    // =========================================== //
    internal static var new: _LBObservableObjectMirror {
        return _LBObservableObjectMirror()
    }
}
