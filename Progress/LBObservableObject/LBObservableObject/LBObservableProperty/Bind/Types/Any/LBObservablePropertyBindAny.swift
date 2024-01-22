//
//  LBObservablePropertyBindAny.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public class LBObservablePropertyBindAny<Value: LBObservablePropertyValueType>: LBObservablePropertyBind<Value, LBObservablePropertyBindAny>, LBObservablePropertyBindProtocol {
    
    internal override init() {
        super.init()
    }
    
    required init(_ property: Property, _ delegate: inout LBObservablePropertyBindAny?, _ body: @escaping Body) {
        super.init(property, &delegate, body)
    }
    
    override func remove(_ delegate: inout LBObservablePropertyBindAny?) {
        super.remove(&delegate)
    }
    
    override func attach(_ delegate: inout LBObservablePropertyBindAny?) {
        super.attach(&delegate)
    }
}

extension LBObservablePropertyBindAny {
    // =============================================== //
    // MARK: -
    // =============================================== //
    internal static var empty: LBObservablePropertyBindAny {
        return LBObservablePropertyBindAny()
    }
}


// MARK: -->> Example
//
//public class LBObservablePropertyBindString: LBObservablePropertyBind<String, LBObservablePropertyBindString>, LBObservablePropertyBindProtocol {
//
//    internal override init() {
//        super.init()
//    }
//    
//    required init(_ property: Property, _ delegate: inout LBObservablePropertyBindString?, _ body: @escaping Body) {
//        super.init(property, &delegate, body)
//    }
//    
//    override func remove(_ delegate: inout LBObservablePropertyBindString?) {
//        super.remove(&delegate)
//    }
//    
//    override func attach(_ delegate: inout LBObservablePropertyBindString?) {
//        super.attach(&delegate)
//    }
//}
//
//extension LBObservablePropertyBindString {
//    // =============================================== //
//    // MARK: -
//    // =============================================== //
//    internal static var empty: LBObservablePropertyBindString {
//        return LBObservablePropertyBindString()
//    }
//}





