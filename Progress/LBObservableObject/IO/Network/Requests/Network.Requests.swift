//
//  Network.Requests.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import Foundation

extension Network {
    // ========================================= //
    // MARK: -
    // ========================================= //
    class Requests {
        
        lazy var posts: PostsRequests = {
            return PostsRequests()
        }()
    }
}

extension Network.Requests: NetworkPostsRequests {
    // ====================================== //
    // MARK: -  //
    // ====================================== //
    
}
