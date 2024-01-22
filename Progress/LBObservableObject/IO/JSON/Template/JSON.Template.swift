//
//  JSON.Template.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import Foundation

extension LBJSON {
    // ============================================== //
    // MARK: -
    // ============================================== //
    class Template: Manager {
        /*
         * */
        internal func get() -> Dictionary<String, Any> {
            return dictionary([:])
        }
        
        internal func get(_ data: [String: Any]) -> Dictionary<String, Any> {
            return dictionary(data)
        }
    }
}

extension LBJSON.Template {
    // ============================================== //
    // MARK: -
    // ============================================== //
    fileprivate func dictionary(_ data: [String: Any]) -> Dictionary<String, Any> {
        return [
            "meta": [
                "authors": [
                    "lioz balki"
                ],
                "copyright" : "Lioz Balki Copyright 2023."
            ],
            "data": data as [String: Any]
            
        ] as [String: Any]
    }
}
