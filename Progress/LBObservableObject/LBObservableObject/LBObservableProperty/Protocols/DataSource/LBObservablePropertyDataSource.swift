//
//  LBObservablePropertyDataSource.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit
import Foundation

protocol LBObservablePropertyDataSource {
    
    associatedtype Value
        
    var value: Any? { get set }
    
    var label: String { get set }
    
    var parent: LBObservableObject? { get set }

}
