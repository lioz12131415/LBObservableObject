//
//  Network.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import Foundation

class Network {
    
    internal static var requsts: Network.Requests {
        get { return Network.Requests() }
    }
}
