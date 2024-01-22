//
//  Post.Builder.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 08/01/2024.
//

import UIKit
import Foundation

extension Post {
    // ================================= //
    // MARK: -
    // ================================= //
    class Builder {
        
        fileprivate var post: Post = .empty
        
        internal init(_ post: Post) {
            self.post = post
        }
        
        internal init() {
            /* */
        }
        
        @discardableResult func set(id: String) -> Self {
            post.id = id
            return self
        }
        
        @discardableResult func set(text: String) -> Self {
            post.text = text
            return self
        }
        
        @discardableResult func set(image: Image) -> Self {
            post.image = image
            return self
        }
        
        @discardableResult func set(member: Member) -> Self {
            post.member = member
            return self
        }
        
        internal func build() -> Post {
            return post 
        }
    }
}
