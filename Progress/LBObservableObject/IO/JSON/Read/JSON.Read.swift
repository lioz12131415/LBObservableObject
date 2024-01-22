//
//  JSON.Read.swift
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
    class Read: Manager {
        
    }
}

extension LBJSON.Read {
    // ============================================== //
    // MARK: -
    // ============================================== //
    internal func data() -> Dictionary<String, Any>? {
        guard let file_url = file_url else {
            return nil
        }
        guard let data = try? Data(contentsOf: file_url, options: []),
              let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            return nil
        }
        return json as? Dictionary<String, Any>
    }
}
