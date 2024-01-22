//
//  JSON.Manager.swift
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
    class Manager {
        
        internal var file_name    = String.empty
        internal var file_manager = FileManager.default
        
        internal var file_url: URL? {
            return document_directory?.appendingPathComponent(file_name)
        }
        
        internal var document_directory: URL? {
            return file_manager.urls(for: .documentDirectory, in: .userDomainMask).first
        }
        
        internal init(file_name: String) {
            self.file_name = file_name
        }
    }
}
