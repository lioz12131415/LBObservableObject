//
//  JSON.Write.swift
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
    class Write: Manager {
    
    }
}

extension LBJSON.Write {
    // ============================================== //
    // MARK: -
    // ============================================== //
    internal  func data(_ dictionary: Dictionary<String, Any>?) {
        guard let file_url = file_url,
              let dictionary = dictionary else {
            return
        }

        guard let stream = OutputStream(toFileAtPath: file_url.path, append: false) else {
            return
        }
        
        defer {
            stream.close()
        }
        
        stream.open()
        
        var error: NSError?
        JSONSerialization.writeJSONObject(dictionary, to: stream, options: [], error: &error)
        
        if let error = error {
            print("error = \(error)")
        }
    }
}

