//
//  Data.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 08/01/2024.
//

import UIKit
import Foundation

class LBData {
    
    internal static var images: [String] {
        return (1..<10).map { String($0) }
    }
    /*
     * */
    internal static func generateIfNeeded() {
        let _json = LBJSON(name: "posts")
        let _read = _json.read()
        let _data = _read?["data"]
        
        if _data == nil {
            generate()
        }
    }
}

extension LBData {
    // ======================================== //
    // MARK: -
    // ======================================== //
    fileprivate static func generate() {
        let images = images
        
        for i in 0..<100 {
            let post   = Post()
        
            post.id          = "post-\(i)"
            post.text        = "text-\(i)"
            post.image.id    = "image-\(i)"
            post.member.id   = "member-\(i)"
            post.member.name = "name-\(i)"
            post.image.value = images.randomElement() ?? ""
           
            Network.requsts.posts.put(post)
        }
    }
}
