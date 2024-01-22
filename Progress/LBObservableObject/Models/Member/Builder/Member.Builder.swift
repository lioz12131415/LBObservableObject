//
//  Member.Builder.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 08/01/2024.
//

import UIKit
import Foundation

extension Member {
    // ================================= //
    // MARK: -
    // ================================= //
    class Builder {
        
        fileprivate var member: Member = .empty
        
        internal init(_ member: Member) {
            self.member = member
        }
        
        internal init() {
            /* */
        }
        
        @discardableResult func set(id: String) -> Self {
            member.id = id
            return self
        }
        
        @discardableResult func set(name: String) -> Self {
            member.name = name
            return self
        }
        
        internal func build() -> Member {
            return member
        }
    }
}
