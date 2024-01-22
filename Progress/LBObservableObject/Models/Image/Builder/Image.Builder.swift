//
//  Image.Builder.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 08/01/2024.
//

import UIKit
import Foundation

extension Image {
    // ================================= //
    // MARK: -
    // ================================= //
    class Builder {
        
        fileprivate var image: Image = .empty
        
        internal init(_ image: Image) {
            self.image = image
        }
        
        internal init() {
            /* */
        }
        
        @discardableResult func set(id: String) -> Self {
            image.id = id
            return self
        }
        
        @discardableResult func set(value: String) -> Self {
            image.value = value
            return self
        }
        
        internal func build() -> Image {
            return image
        }
    }
}
