//
//  JSON.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import Foundation

class LBJSON {
    
    fileprivate lazy var _name     = String.empty
    fileprivate lazy var _read     = Read(file_name: _name + ".json")
    fileprivate lazy var _write    = Write(file_name: _name + ".json")
    fileprivate lazy var _template = Template(file_name: _name + ".json")
        
    internal init(name: String) {
        self._name = name
    }

    internal func read() -> Dictionary<String, Any>? {
        return _read.data()
    }
    
    internal func write(_ data: Dictionary<String, Any>?) {
        _write.data(data)
    }
    
    internal func template() -> Dictionary<String, Any>? {
        return _template.get()
    }
    
    internal func template(_ data: [String: Any]) -> Dictionary<String, Any>? {
        return _template.get(data)
    }
}



















//    static func retrieveFromJsonFile() {
//        // Get the url of Persons.json in document directory
//        guard let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//        let fileUrl = documentsDirectoryUrl.appendingPathComponent(file_name)
//
//        // Read data from .json file and transform data into an array
//        do {
//            let data = try Data(contentsOf: fileUrl, options: [])
//            guard let personArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: [String: String]]] else { return }
//            print(personArray) // prints [["person": ["name": "Dani", "age": "24"]], ["person": ["name": "ray", "age": "70"]]]
//        } catch {
//            print(error)
//        }
//    }
